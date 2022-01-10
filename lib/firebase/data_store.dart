import 'package:clone_netflix/enum/service_name.dart';
import 'package:clone_netflix/model/movie_data.dart';
import 'package:clone_netflix/model/movie_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataStore extends StatelessWidget {
  final ServiceName serviceName;
  final String? searchText;

  const DataStore({required this.serviceName, this.searchText});

  Widget rebuildBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: ConnectedService(serviceName),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return buildList(context, snapshot.data!.documents);
      },
    );
  }

  Widget buildList(context, snapshot) {
    List<DocumentSnapshot> searchResult = [];

    if (serviceName == ServiceName.MOVIE) {
      for (DocumentSnapshot document in snapshot) {
        if (document.data.toString().contains(searchText!)) {
          searchResult.add(document);
        }
      }
    }

    return snapshot.toString().isEmpty
        ? Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.5,
              padding: EdgeInsets.all(3.0),
              children: serviceName == ServiceName.MOVIE
                  ? searchResult
                      .map((data) => posterItem(context, data))
                      .toList()
                  : snapshot.map((data) => posterItem(context, data)).toList(),
            ),
          )
        : Container();
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
