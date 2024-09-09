import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news/bloc/states.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/repo/repo.dart';

import '../utils/constants.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeRepo repo;
  HomeCubit(this.repo): super(HomeInitState());
  static HomeCubit get (context)=>BlocProvider.of(context);
  int selectedTabIndex = 0;
  NewsDataResponse? newsDataResponse ;
  SourcesResponse? sourcesResponse ;
  changeSource(int value){
    selectedTabIndex =value;
    emit(HomeChangeSource());
  }


   Future<void> getSources(String id) async{

   try{
     emit(HomeGetSourcesLoadingState());
   sourcesResponse =await repo.getSources(id);


     emit(HomeGetSourcesSuccessState());
     getNewsData(sourcesResponse?.sources?[selectedTabIndex].id??"");
   } catch (e){
     emit(HomeGetSourcesErrorState());
   }

  }


   Future<void> getNewsData(String sourceID) async{
   try{
     emit(HomeGetNewsDataLoadingState());
     newsDataResponse = await repo.getNewsData(sourceID);

     emit(HomeGetNewsDataSuccessState());

   }catch (e){
     emit(HomeGetNewsDataErrorState());
   }

  }


}