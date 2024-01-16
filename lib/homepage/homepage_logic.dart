import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final homepageLogic = ChangeNotifierProvider<HomePageLogic>((ref) {
  return HomePageLogic();
});

class HomePageLogic extends ChangeNotifier {
bool islistening =false;
  lisitening(){
    islistening= !islistening;
    notifyListeners();
  }



}



