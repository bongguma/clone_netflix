import 'package:clone_netflix/layout/box_slider.dart';
import 'package:clone_netflix/layout/carouse_movie.dart';
import 'package:clone_netflix/layout/circle_slider.dart';
import 'package:clone_netflix/layout/top_bar.dart';
import 'package:clone_netflix/model/movieData_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _NetflixHomeState createState() => _NetflixHomeState();
}

class _NetflixHomeState extends State<HomeScreen> {
  List<MovieData> movieList = [
    MovieData.fromMap({
      'title': '사랑의 불시착',
      'content': '로맨스',
      'poster': 'images/netflix_poster.png',
      'like': false,
    }),
    MovieData.fromMap({
      'title': '그 해 여름',
      'content': '학교생활에 대한 이야기',
      'poster': 'images/netflix_poster.png',
      'like': false,
    })
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            CarouseMovie(
              movieList: movieList,
            ),
            TopBar(),
          ],
        ),
        CircleSlider(movieList: movieList),
        BoxleSlider(movieList: movieList),
      ],
    );
  }
}
