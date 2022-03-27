import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'networkHelper.dart';
import 'resultCard.dart';

const apiKey = '0acfcc9dc75d91492b10d58aff886874';
String spacetoperc20(String query) {
  String keyword = '';
  for (var i = 0; i < query.length; i++) {
    if (query[i] == ' ') {
      keyword = keyword + '%20';
    } else {
      keyword = keyword + query[i];
    }
  }                       
  return keyword;
}

class MovieData extends ChangeNotifier {
  List<ResultCard> _movieData = [];
  Future<dynamic> getMovieData(String query) async {
    String keyword = spacetoperc20(query);

    var url =
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&query=$keyword&page=1&include_adult=false';

    NetworkHelper networkHelper = NetworkHelper(url);
    var movieData = await networkHelper.getdata();
    return movieData;
  }

  List<Widget> getList() {
    return _movieData;
  }

  void addData(ResultCard newData) {
    _movieData.add(newData);
    notifyListeners();
  }

  void clearList() {
    _movieData.clear();
    notifyListeners();
  }
}
