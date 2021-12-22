import 'package:clone_netflix/enum/service_name.dart';
import 'package:clone_netflix/model/movieData_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataStore extends StatelessWidget {
  final ServiceName serviceName;

  const DataStore({required this.serviceName});

  Widget rebuildBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('movie')
          .where('like', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return buildList(context, snapshot.data!.documents);
      },
    );
  }

  Widget buildList(context, snapshot) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.5,
        padding: EdgeInsets.all(3.0),
        children: snapshot.map((data) => posterItem(context, data)).toList(),
      ),
    );
  }

  Widget posterItem(context, data) {
    final movieData = MovieData.fromSnapshot(data);
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Image.asset(movieData.poster),
      ),
      onTap: () {
        Get.toNamed('/netflixDetail', arguments: movieData);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return rebuildBody();
  }
}
