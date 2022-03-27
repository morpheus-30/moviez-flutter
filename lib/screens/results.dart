// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:moviez/constants.dart';
import 'package:flutter/material.dart';
import 'package:moviez/movieDBinfo.dart';
import 'package:provider/provider.dart';

class Results extends StatelessWidget {
  String movieSearched;
  Results({required this.movieSearched});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'Icon',
          child: Image(
            alignment: Alignment.topCenter,
            image: NetworkImage(
                'https://img.search.brave.com/UqHkqR4qrHy6n5b__0yuX1v8Sfh-JuchZWV09hPQB-4/rs:fit:626:625:1/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS12ZWN0b3Iv/bS1nb2xkLWxvZ28t/ZGVzaWduXzY3NzM0/LTkzLmpwZz9zaXpl/PTYyNiZleHQ9anBn'),
          ),
        ),
        backgroundColor: kbgcolor,
        title: Text(
          'Results for: ' + movieSearched,
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'JosefinSans',
              fontWeight: FontWeight.w100,
              color: kmainUIcolor,
              decoration: TextDecoration.none),
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: Provider.of<MovieData>(context, listen: false).getList(),
        ),
      ),
    );
  }
}
