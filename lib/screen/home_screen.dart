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

  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  Stream<QuerySnapshot>? streamData;

  @override
  void initState() {
    super.initState();

    streamData = fireStore.collection('movie').snapshots();
  }

  Widget fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return LinearProgressIndicator();
        return fetchBody(context, snapshot.data!.docs);
      },
    );
  }

  Widget fetchBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Container();
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
