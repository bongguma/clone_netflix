import 'package:clone_netflix/model/movie_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleSlider extends StatelessWidget {
  final List<MovieData> movieList;

  CircleSlider({required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('미리보기'),
          Container(
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: makeCircleImageList(movieList),
              ))
        ],
      ),
    );
  }
}

List<Widget> makeCircleImageList(List<MovieData> movieList) {
  List<Widget> resultList = [];

  for (var i = 0; i < movieList.length; i++) {
    resultList.add(InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(right: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: CircleAvatar(
            backgroundImage: AssetImage(movieList[i].poster),
          ),
        ),
      ),
    ));
  }

  return resultList;
}
