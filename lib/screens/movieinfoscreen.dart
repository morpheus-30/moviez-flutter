// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moviez/constants.dart';

class MovieInfo extends StatelessWidget {
  String title;
  String image_url;
  dynamic rating;
  dynamic votecount;
  String dor;
  String synopsis;
  MovieInfo(
      {required this.votecount,
      required this.rating,
      required this.title,
      required this.image_url,
      required this.dor,
      required this.synopsis});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: SizedBox(),
        title: Hero(
          tag: 'Icon',
          child: Center(
            child: Container(
              padding: EdgeInsets.only(right: 60),
              child: CircleAvatar(
                backgroundColor: Colors.black45,
                radius: 80,
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
          ),
        ),
        toolbarHeight: 500,
        flexibleSpace: Image(
          fit: BoxFit.cover,
          image: NetworkImage(image_url),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w400,
                    color: kmainUIcolor,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              child: Text(
                'Rating: $rating',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w100,
                    color: kmainUIcolor,
                    decoration: TextDecoration.none),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Text(
                'VoteCount: $votecount',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w100,
                    color: kmainUIcolor,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                dor,
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w100,
                    color: kmainUIcolor,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                synopsis,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w100,
                    color: kmainUIcolor,
                    decoration: TextDecoration.none),
              ),
            )
          ],
        ),
      ),
    );
  }
}
