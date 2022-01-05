import 'package:clone_netflix/enum/service_name.dart';
import 'package:clone_netflix/firebase/data_store.dart';
import 'package:clone_netflix/layout/base_layout.dart';
import 'package:clone_netflix/layout/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  _LikeState createState() => _LikeState();
}

class _LikeState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      isCloseApp: true,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 27.0, 20.0, 7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'images/netflix_logo.png',
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
      bottomBar: BottomBar(),
    );
  }
}
