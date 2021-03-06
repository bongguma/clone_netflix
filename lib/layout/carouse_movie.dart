import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone_netflix/model/movie_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouseMovie extends StatefulWidget {
  final List<MovieData> movieList;

  const CarouseMovie({required this.movieList});

  @override
  _CarouseMovieState createState() => _CarouseMovieState();
}

class _CarouseMovieState extends State<CarouseMovie> {
  Firestore firestore = Firestore.instance;
  List<MovieData>? movieList;
  List<Widget>? imageList;
  List<String>? titleList;
  List<String>? contentList;
  List<bool>? likeList;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    movieList = widget.movieList;
    imageList = movieList!.map((movie) => Image.asset(movie.poster)).toList();
    contentList = movieList!.map((movie) => movie.content).toList();
    likeList = movieList!.map((movie) => movie.like).toList();
  }

  Widget contentSlider() {
    return CarouselSlider(
        items: imageList,
        options: CarouselOptions(
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentPage = index;
            });
          },
        ));
  }

  // 좋아하는 컨텐츠 비동기식 데이터 전환
  Future _changeLike(currentPage) async {
    await Firestore.instance
        .collection('movie')
        .document('movie${currentPage + 1}')
        .updateData({'like': likeList![_currentPage] ? false : true});

    await Firestore.instance
        .collection('movie')
        .getDocuments()
        .then((snapshot) {
      movieList = snapshot.documents
          .map((movieData) => MovieData.fromSnapshot(movieData))
          .toList();
    });

    setState(() {
      likeList = movieList!.map((movie) => movie.like).toList();
    });
  }

  // 콘텐츠 찜하는 기능
  Widget addContents() {
    return Container(
      child: Column(
        children: [
          likeList![_currentPage]
              ? IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    _changeLike(_currentPage);
                  })
              : IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _changeLike(_currentPage);
                  }),
          Text(
            '내가 찜한 콘텐츠',
            style: TextStyle(fontSize: 11.0),
          )
        ],
      ),
    );
  }

  // 콘텐츠를 실행시키는 재생 기능
  Widget playVideo() {
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: FlatButton(
        color: Colors.white,
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.play_arrow,
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.all(3.0),
            ),
            Text(
              '재생',
              style: TextStyle(color: Colors.black),
            ),
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
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Get.toNamed('/netflixDetail',
                    arguments: movieList![_currentPage]);
              }),
          Text(
            '정보',
            style: TextStyle(
              fontSize: 11.0,
            ),
          ),
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
            child: Text(contentList![_currentPage]),
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
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicator(likeList!, _currentPage),
          ))
        ],
      ),
    );
  }
}

List<Widget> indicator(List? list, int currentPage) {
  List<Widget> resultList = [];
  for (var i = 0; i < list!.length; i++) {
    resultList.add(Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == i ? Colors.white : Colors.white.withOpacity(0.3),
      ),
    ));
  }

  return resultList;
}
