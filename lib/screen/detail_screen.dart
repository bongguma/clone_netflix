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
    print('argument :: ${movieData!.title} content :: ${movieData!.content}');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: [
              Stack(
                children: [
                  movieDetailInfo(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
