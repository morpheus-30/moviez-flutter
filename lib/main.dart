import 'package:flutter/material.dart';
import 'package:moviez/movieDBinfo.dart';
import 'package:moviez/screens/search.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
// import 'screens/results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MovieData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kbgcolor),
        home: SearchScreen(),
      ),
    );
  }
}
