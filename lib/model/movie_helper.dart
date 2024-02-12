import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/model/search_model.dart';

import '../view/home.dart';
import 'idmodel.dart';

class MovieHelper {
  static MovieHelper instant = MovieHelper._();
  final String _baseurl = "http://www.omdbapi.com/?";

  MovieHelper._();

  factory MovieHelper() {
    return instant;
  }

  Future<IdModel?> iSearch(String val) async {
    String api = "i=$val&apikey=6adfe995";
    String apiData = _baseurl + api;
    http.Response responce = await http.get(Uri.parse(apiData));
    if (responce.statusCode == 200) {
      Map data = jsonDecode(responce.body);
      IdModel res = idModelFromJson(responce.body);
      return res;
    } else {
      return null;
    }
  }

  Future<SearchModel?> searchApi(String search) async {
    String searcchkey = "s=$search&apikey=6adfe995";
    String api = _baseurl + searcchkey;
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      SearchModel res = searchModelFromJson(response.body);
      return res;
    } else {
      return null;
    }
  }



}
