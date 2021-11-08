import 'package:clone_netflix/layout/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetflixMain extends StatefulWidget{
  const NetflixMain({Key? key}) : super(key: key);


  @override
  _NeflixMainState createState() => _NeflixMainState();
}

class _NeflixMainState extends State<NetflixMain> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = new TabController(vsync: this, length: 4);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}