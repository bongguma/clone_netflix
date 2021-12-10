import 'package:clone_netflix/model/movieData_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailScreen> {
  MovieData? movieData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    movieData = Get.arguments as MovieData;

  }

  /* movieDetail한 정보 보여주는 Widget */
  Widget movieDetailInfo() {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(movieData!.poster),
        fit: BoxFit.cover,
      )),
      child: blurDetailPoster(),
    );
  }

  /* poster 뒷 면 blur 이미지 Widget */
  Widget blurDetailPoster() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.1),
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 10.0),
                  child: Image.asset(movieData!.poster),
                  height: 300.0,
                ),
                Container(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    '99% 일치 2019 15+ 시즌 1개',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                playBtn(),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(''),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* 재생 버튼 Widget */
  Widget playBtn() {
    return Container(
      padding: EdgeInsets.all(3.0),
      width: 380,
      color: Colors.red,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.red.withOpacity(1.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_arrow),
            Text('재생'),
          ],
        ),
      ),
    );
  }

  /* 찜한 콘텐츠 Widget */
  Widget likeMoiveBtn() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            movieData!.like ? Icon(Icons.check) : Icon(Icons.add),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            subBtnTextStyle('내가 찜한 콘텐츠'),
          ],
        ),
      ),
    );
  }

  /* 평가 Widget */
  Widget ratingMoiveBtn() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Container(
        child: Column(
          children: [
            Icon(Icons.thumb_up),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            subBtnTextStyle('평가'),
          ],
        ),
      ),
    );
  }

  /* 공유 Widget */
  Widget sendMovieBtn() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Container(
        child: Column(
          children: [
            Icon(Icons.send),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            subBtnTextStyle('공유'),
          ],
        ),
      ),
    );
  }

  /* subBtn title widget */
  Widget subBtnTextStyle(String btnTitle) {
    return Text(
      btnTitle,
      style: TextStyle(
        fontSize: 11.0,
        color: Colors.white60,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SafeArea(
            child: ListView(
              children: [
                Stack(
                  children: [
                    movieDetailInfo(),
                    Positioned(
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        )),
                  ],
                ),
                Container(
                  color: Colors.black26,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      likeMoiveBtn(),
                      ratingMoiveBtn(),
                      sendMovieBtn(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
