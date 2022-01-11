import 'package:clone_netflix/model/movie_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxleSlider extends StatelessWidget {
  final List<MovieData> movieList;

  BoxleSlider({required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('지금 뜨는 콘텐츠'),
          Container(
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: makeBoxImageList(movieList),
              ))
        ],
      ),
    );
  }
}

List<Widget> makeBoxImageList(List<MovieData> movieList) {
  List<Widget> resultList = [];

  for (var i = 0; i < movieList.length; i++) {
    resultList.add(InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(right: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(movieList[i].poster),
        ),
      ),
    ));
  }

  return resultList;
}
