

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends  Cubit<HomeStates>{

  HomeViewModel():super(initialState());
  int currentIndex=0;

  static HomeViewModel get(BuildContext context){
    return BlocProvider.of(context);
  }
  changeIndex(int newIndex){
    currentIndex=newIndex;
    emit(changestate());
  }
}


abstract class HomeStates{}
class initialState extends HomeStates{}
class changestate extends HomeStates{}