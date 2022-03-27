// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moviez/constants.dart';
import 'package:moviez/resultCard.dart';
import 'package:moviez/screens/results.dart';
import 'package:moviez/movieDBinfo.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String movieSearched = '';
  bool isload = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: LoaderOverlay(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'Icon',
                        child: Image(
                            alignment: Alignment.topCenter,
                            image: AssetImage('assets/logo.png')),
                      ),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextField(
                            style: TextStyle(
                                fontFamily: 'JosefinSans', color: kmainUIcolor),
                            onChanged: (value) {
                              movieSearched = value;
                            },
                            decoration: kTextFieldDecoration,
                          ),
                        ),
                        IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.search,
                            color: kmainUIcolor,
                          ),
                          onPressed: () async {
                            context.loaderOverlay.show();
                            var movieData =
                                await MovieData().getMovieData(movieSearched);
                            if (movieData == null ||
                                movieData['results'].length == 0) {
                              context.loaderOverlay.hide();
                              AlertBox(context).show();
                            } else {
                              // print(movieData);
                              Provider.of<MovieData>(context, listen: false)
                                  .clearList();

                              for (var i = 0;
                                  i < movieData['results'].length;
                                  i++) {
                                ResultCard result = ResultCard(
                                  image_url: movieData['results'][i]
                                              ['poster_path'] ==
                                          null
                                      ? 'https://img.search.brave.com/UqHkqR4qrHy6n5b__0yuX1v8Sfh-JuchZWV09hPQB-4/rs:fit:626:625:1/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS12ZWN0b3Iv/bS1nb2xkLWxvZ28t/ZGVzaWduXzY3NzM0/LTkzLmpwZz9zaXpl/PTYyNiZleHQ9anBn'
                                      : 'https://image.tmdb.org/t/p/w500/' +
                                          movieData['results'][i]
                                              ['poster_path'],
                                  info: movieData['results'][i]['overview'] ==
                                          null
                                      ? ''
                                      : movieData['results'][i]['overview'],
                                  votecount: movieData['results'][i]
                                              ['vote_count'] ==
                                          null
                                      ? ''
                                      : movieData['results'][i]['vote_count'],
                                  movie_name: movieData['results'][i]
                                              ['original_title'] ==
                                          null
                                      ? ''
                                      : movieData['results'][i]
                                          ['original_title'],
                                  rating: movieData['results'][i]
                                              ['vote_average'] ==
                                          null
                                      ? ''
                                      : movieData['results'][i]['vote_average'],
                                  dor: movieData['results'][i]
                                              ['release_date'] ==
                                          null
                                      ? ''
                                      : movieData['results'][i]['release_date'],
                                );
                                Provider.of<MovieData>(context, listen: false)
                                    .addData(result);
                              }
                              context.loaderOverlay.hide();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Results(
                                    movieSearched: movieSearched,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Alert AlertBox(BuildContext context) {
    return Alert(
      context: context,
      style: alertStyle,
      type: AlertType.error,
      title: "0 Results Found! :(",
      desc: "Please Recheck the spelling :)",
      buttons: [
        DialogButton(
          child: Text(
            "Back!",
            style: TextStyle(color: Colors.brown, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: kmainUIcolor,
          radius: BorderRadius.circular(20.0),
        ),
      ],
    );
  }
}
