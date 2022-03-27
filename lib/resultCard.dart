// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/movieinfoscreen.dart';
import 'package:truncate/truncate.dart';
// import 'movieDBinfo.dart';

String shortInfo(String info) {
  return truncate(info, 100, omission: '...');
}

class ResultCard extends StatelessWidget {
  ResultCard(
      {required this.image_url,
      required this.movie_name,
      required this.info,
      required this.votecount,
      required this.rating,
      required this.dor});
  String image_url;
  String movie_name;
  String info;
  String dor;
  dynamic votecount;
  dynamic rating;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            style: BorderStyle.none,
            color: kmainUIcolor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            fit: BoxFit.cover,
            height: 60,
            width: 60,
            image: NetworkImage(image_url),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieInfo(
                image_url: image_url,
                title: movie_name,
                dor: dor,
                rating: rating,
                synopsis: info,
                votecount: votecount,
              ),
            ),
          );
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie_name,
              style: TextStyle(
                fontFamily: 'JosefinSans',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              shortInfo(info),
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 13,
                fontFamily: 'JosefinSans',
              ),
            )
          ],
        ),
      ),
      color: kCardColor,
    );
  }
}
