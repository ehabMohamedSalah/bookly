//hyobaa feh al logha w al theme w 3shan al etnen tb3 al setting 3mlto fe file wahed

//provider: observable -subject-publisher
//ChangeNotifier:ay tghyer hy7sl fe al data hyro7 ynotify al observers

import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{


  String searchQuery = "";
  bool isSearchEmpty = true ;
  changeSearchState(bool newState){
    isSearchEmpty = newState;
    notifyListeners();
  }
  changeSearchQuery(String newSearchQuery){
    if(newSearchQuery.isEmpty||newSearchQuery ==""){
      isSearchEmpty= true ;
      notifyListeners();

    }else{
      isSearchEmpty = false ;
      notifyListeners();

    }
    searchQuery = newSearchQuery ;
    notifyListeners();
  }



}
