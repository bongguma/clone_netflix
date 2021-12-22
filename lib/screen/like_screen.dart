import 'package:clone_netflix/enum/service_name.dart';
import 'package:clone_netflix/firebase/data_store.dart';
import 'package:clone_netflix/layout/base_layout.dart';
import 'package:clone_netflix/model/movieData_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  _LikeState createState() => _LikeState();
}

class _LikeState extends State<LikeScreen> {
  // Widget rebuildBody(BuildContext context) {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: Firestore.instance
  //         .collection('movie')
  //         .where('like', isEqualTo: true)
  //         .snapshots(),
  //     builder: (context, snapshot) {
  //       if (!snapshot.hasData) return LinearProgressIndicator();
  //       return buildList(context, snapshot.data!.documents);
  //     },
  //   );
  // }
  //
  // Widget buildList(context, snapshot) {
  //   return Expanded(
  //     child: GridView.count(
  //       crossAxisCount: 3,
  //       childAspectRatio: 1 / 1.5,
  //       padding: EdgeInsets.all(3.0),
  //       children: snapshot.map((data) => posterItem(context, data)).toList(),
  //     ),
  //   );
  // }
  //
  // Widget posterItem(context, data) {
  //   final movieData = MovieData.fromSnapshot(data);
  //   return InkWell(
  //     child: Padding(
  //       padding: EdgeInsets.only(right: 8.0),
  //       child: Image.asset(movieData.poster),
  //     ),
  //     onTap: () {
  //       Get.toNamed('/netflixDetail', arguments: movieData);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 27.0, 20.0, 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    '',
                    fit: BoxFit.contain,
                    height: 25.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      '내가 찜한 콘텐츠',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  )
                ],
              ),
            ),
            DataStore(serviceName: ServiceName.LIKE),
          ],
        ),
      ),
    );
  }
}
