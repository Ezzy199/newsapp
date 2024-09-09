import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/language_cubit.dart';
import 'package:news/generated/l10n.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(

        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<LanguageCubit>(context).toArabic();
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).arabic,

                ),
                Icon(Icons.done


                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<LanguageCubit>(context).toEnglish();
                  Navigator.pop(context);
                },
                child: Text(
                  S.of(context).english,

                ),
              ),
              // Icon(
              //   Icons.done,
              //   // color: MyThemeData.primaryColor,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
