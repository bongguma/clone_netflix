import 'package:clone_netflix/screen/detail_screen.dart';
import 'package:clone_netflix/screen/netflix_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(Root());
}

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();

  }

  List<GetPage> renderPages() {

    return [
      GetPage(
        name: '/netflixMain',
        page: () => NetflixMain(),
        transition: Transition.noTransition,
      ),
      GetPage(
        name: '/netflixDetail',
        page: () => DetailScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlutterStudy',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      initialRoute: '/netflixMain',
      debugShowCheckedModeBanner: false,
      getPages: renderPages(),
    );
  }
}