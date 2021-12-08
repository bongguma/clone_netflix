import 'package:clone_netflix/layout/box_slider.dart';
import 'package:clone_netflix/layout/carouse_movie.dart';
import 'package:clone_netflix/layout/circle_slider.dart';
import 'package:clone_netflix/layout/top_bar.dart';
import 'package:clone_netflix/model/movieData_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _NetflixHomeState createState() => _NetflixHomeState();
}

class _NetflixHomeState extends State<HomeScreen> {

  Firestore fireStore = Firestore.instance;
  Stream<QuerySnapshot>? streamData;

  @override
  void initState() {
    super.initState();

    streamData = fireStore.collection('movie').snapshots();
  }

  Widget fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return LinearProgressIndicator();
        return fetchBody(context, snapshot.data!.documents);
      },
    );
  }

  Widget fetchBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<MovieData> movieList = snapshot.map((movieData) => MovieData.fromSnapshot(movieData)).toList();
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

  @override
  Widget build(BuildContext context) {
    return fetchData(context);
  }
}
