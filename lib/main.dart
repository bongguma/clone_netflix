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
      // GetPage(
      //   name: '/',
      //   page: () => ,
      //   transition: Transition.noTransition,
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlutterStudy',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      getPages: renderPages(),
    );
  }
}