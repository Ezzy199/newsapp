import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/states.dart';
import 'package:news/repo/home_remote_ds_impl.dart';

import 'package:news/ui/news_item.dart';
import 'package:news/ui/tab_item.dart';

import '../main.dart';
import '../models/SourcesResponse.dart';
import '../repo/home_local_ds_impl.dart';


class NewsUi extends StatelessWidget {
  String id;

  NewsUi({required this.id, super.key});

   // int selectedTabIndex = 0;

  // List<Sources> sources = [];

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) =>
        HomeCubit( isConnect? HomeRemoteDsImpl():HomeLocalDsImpl())
          ..getSources(id),
        child: BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
          if (state is HomeGetSourcesLoadingState ||
              state is HomeGetNewsDataLoadingState) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          if (state is HomeGetNewsDataErrorState) {
            {
              showDialog(context: context, builder: (context) =>
                  AlertDialog(
                    title: Text('Error'),
                    content: Text('something went wrong'),

                  ));
            }
            if (state is HomeGetNewsDataErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('something went wrong')),
              );
            }
          }
          if (state is HomeChangeSource) {
            HomeCubit.get(context).getNewsData(HomeCubit
                .get(context)
                .sourcesResponse
                ?.sources?[HomeCubit
                .get(context)
                .selectedTabIndex]
                .id ??
                "");
          }
        }, builder: (context, state) {
          if (state is HomeGetSourcesErrorState) {
            return Text('something went wrong');
          }
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                DefaultTabController(
                    length: HomeCubit
                        .get(context)
                        .sourcesResponse
                        ?.sources
                        ?.length ??
                        0,
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      onTap: (value) {
                        HomeCubit.get(context).changeSource(value);
                      },
                      tabs: HomeCubit
                          .get(context)
                          .sourcesResponse
                          ?.sources
                          ?.map((e) =>
                          TabItem(
                            sources: e,
                            isSelected: HomeCubit
                                .get(context)
                                .sourcesResponse!
                                .sources!
                                .elementAt(HomeCubit
                                .get(context)
                                .selectedTabIndex) ==
                                e,
                          ))
                          .toList() ??
                          [],
                    )),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 8,
                        ),
                    itemBuilder: (context, index) {
                      return NewsItem(
                          articles: HomeCubit
                              .get(context)
                              .newsDataResponse!
                              .articles![index]);
                    },
                    itemCount: HomeCubit
                        .get(context)
                        .newsDataResponse
                        ?.articles
                        ?.length ??
                        0,
                  ),
                )
              ]));
        }),
      ),
    );


    //   FutureBuilder(
    //  future: ApiManager.getSources(widget.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError) {
    //       return Text("something went wrong");
    //     }
    //     sources = snapshot.data?.sources ?? [];
    //     return Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         children: [
    //           DefaultTabController(
    //               length: sources.length,
    //             child: TabBar(
    //                   isScrollable: true,
    //                   indicatorColor: Colors.transparent,
    //                  dividerColor: Colors.transparent,
    //                   onTap: (value) {
    //                  selectedTabIndex = value;
    //                     setState(() {});
    //                   },
    //                   tabs: sources
    //                       .map((e) => TabItem(
    //                             sources: e,
    //                             isSelected:
    //                                 sources.elementAt(selectedTabIndex) == e,
    //                          ))
    //                       .toList())),
    //
    //        ],
    //       ),
    //     );
    //   },
    // );
    // }
  }
}