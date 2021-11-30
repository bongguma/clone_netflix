import 'package:clone_netflix/layout/bottom_bar.dart';
import 'package:clone_netflix/screen/home_screen.dart';
import 'package:clone_netflix/screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetflixMain extends StatefulWidget{
  const NetflixMain({Key? key}) : super(key: key);


  @override
  _NetflixMainState createState() => _NetflixMainState();
}

class _NetflixMainState extends State<NetflixMain> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = new TabController(vsync: this, length: 4);

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4,
      child: Scaffold(
      body: SafeArea(
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomeScreen(),
            Container(),
            Container(),
            Container(),
          ]
        ),
      ),
      bottomNavigationBar: BottomBar(),
    ),
    );
  }
}