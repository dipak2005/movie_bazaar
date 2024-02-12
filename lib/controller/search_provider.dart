import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../view/home.dart';

class SearchProvider extends ChangeNotifier {
  final String _baseurl = "http://www.omdbapi.com/?";
  int i = 0;
  String sMovie = "";
  int index = 0;

  searchApi(String search) async {
    String searcchkey = "s=$search&apikey=6adfe995";
    String api = _baseurl + searcchkey;
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      sMovie = search;
      notifyListeners();
    }
  }

  searchPage(String page, String search) async {
    String searcchkey = "s=$search&page=$page&apikey=6adfe995";
    String api = _baseurl + searcchkey + page;
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      sMovie = search;
      notifyListeners();
    }
  }
}
