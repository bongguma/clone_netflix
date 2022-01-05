import 'package:clone_netflix/layout/base_layout.dart';
import 'package:clone_netflix/layout/bottom_bar.dart';
import 'package:clone_netflix/screen/home_screen.dart';
import 'package:flutter/material.dart';

class NetflixMain extends StatefulWidget {
  const NetflixMain({Key? key}) : super(key: key);

  @override
  _NetflixMainState createState() => _NetflixMainState();
}

class _NetflixMainState extends State<NetflixMain>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = new TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      isCloseApp: true,
      body: HomeScreen(),
      bottomBar: BottomBar(),
    );
  }
}
