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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
          ),
          CarouselSlider(
            items: imageList,
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = contentList![_currentPage];
                });
              },
            )),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
            child: Text(_currentKeyword!),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      likeList![_currentPage] ? IconButton( icon: Icon(Icons.check), onPressed: (){
                        
                      }) : IconButton( icon: Icon(Icons.add), onPressed: (){

                      }),
                      Text('내가 찜한 콘텐츠', style: TextStyle(fontSize: 11.0),)
                    ],
                  ),
                ),
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
                ),
                Container(
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }



}