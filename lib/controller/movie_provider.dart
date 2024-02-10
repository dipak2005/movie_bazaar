import 'package:flutter/material.dart';
import 'package:movie_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/search_model.dart';

class MovieProvider extends ChangeNotifier {
  int index = 0;
int? intVat;
  bool isShow = false;
  List<String> likeList = preferences.getStringList("movie") ?? [];

  void changeIndex(int index) {
    index = index;
    notifyListeners();
  }

  void likeIndex(int index) {
     intVat = int.parse(likeList[index]);
    intVat = index;
    notifyListeners();
  }

  void likeMovie(String? movie) async {
    likeList.add(movie ?? "");
  final   SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList("movie", likeList);
    notifyListeners();
  }

  void removeMovie(String? movie) async {
    likeList.remove(movie ?? "");
   final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList("movie", likeList);
    notifyListeners();
  }

  void show() {
    isShow = true;
    notifyListeners();
  }

  void hide() {
    isShow = false;
    notifyListeners();
  }
}
