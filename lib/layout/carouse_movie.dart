import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone_netflix/model/movieData_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouseMovie extends StatefulWidget {
  final List<MovieData> movieList;

  const CarouseMovie({required this.movieList});

  @override
  _CarouseMovieState createState() => _CarouseMovieState();
}

class _CarouseMovieState extends State<CarouseMovie> {
  List<MovieData>? movieList;
  List<Widget>? imageList;
  List<String>? contentList;
  List<bool>? likeList;

  int _currentPage = 0;
  String? _currentKeyword;

  @override
  void initState() {
    super.initState();

    movieList = widget.movieList;
    imageList = movieList!.map((movie) => Image.asset(movie.poster)).toList();
    contentList = movieList!.map((movie) => movie.content).toList();
    likeList = movieList!.map((movie) => movie.like).toList();

    _currentKeyword = contentList![0];
  }

  Widget contentSlider() {
    return CarouselSlider(
        items: imageList,
        options: CarouselOptions(
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentPage = index;
              _currentKeyword = contentList![_currentPage];
            });
          },
        ));
  }

  // 콘텐츠 찜하는 기능
  Widget addContents() {
    return Container(
      child: Column(
        children: [
          likeList![_currentPage] ? IconButton( icon: Icon(Icons.check), onPressed: (){

          }) : IconButton( icon: Icon(Icons.add), onPressed: (){}),
          Text('내가 찜한 콘텐츠', style: TextStyle(fontSize: 11.0),)
        ],
      ),
    );
  }

  // 콘텐츠를 실행시키는 재생 기능
  Widget playVideo() {
    return
      Container(
        padding: EdgeInsets.only(right: 10.0),
        child: FlatButton(
          color: Colors.white,
          onPressed: (){

          },
          child: Row(
            children: [
              Icon(Icons.play_arrow,
                color: Colors.black,
              ),
              Padding(padding: EdgeInsets.all(3.0),),
              Text('재생', style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
      );
  }

  // 콘텐츠 정보를 보여주는 기능
  Widget showInfo() {
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          IconButton( icon: Icon(Icons.info),
              onPressed: (){

              }),
          Text('정보', style: TextStyle(
            fontSize: 11.0,
          ),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
          ),
          contentSlider(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
            child: Text(_currentKeyword!),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                addContents(),
                playVideo(),
                showInfo(),
              ],
            ),
          )
        ],
      ),
    );
  }



}