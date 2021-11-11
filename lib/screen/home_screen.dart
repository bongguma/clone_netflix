import 'package:clone_netflix/layout/carouse_movie.dart';
import 'package:clone_netflix/model/movieData_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _NetflixHomeState createState() => _NetflixHomeState();

}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('images/netflix_logo.png',
            fit: BoxFit.contain,
            height: 25),
          Container(
            padding: EdgeInsets.only(right: 1.0),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14.0)),
          ),
          Container(
            padding: EdgeInsets.only(right: 1.0),
            child: Text(
                '영화',
                style: TextStyle(fontSize: 14.0)),
          ),
          Container(
            padding: EdgeInsets.only(right: 1.0),
            child: Text(
                '내가 찜한 콘텐츠',
                style: TextStyle(fontSize: 14.0)),
          )
        ],
      ),
    );
  }

}

class _NetflixHomeState extends State<HomeScreen> {

  List<MovieData> movieList = [
    MovieData.fromMap({
      'title':'사랑의 불시착',
      'content':'로맨스',
      'poster' : 'images/netflix_poster.png',
      'like' : false,
    })
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[
        Stack(
          children: [
            CarouseMovie(movieList: movieList),
            TopBar(),
          ],
        )
      ],
    );
  }

}
