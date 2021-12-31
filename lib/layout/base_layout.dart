import 'dart:io';

import 'package:flutter/material.dart';

class BaseLayout extends StatefulWidget {
  final Widget body;
  final Widget? bottomBar;

  const BaseLayout({required this.body, this.bottomBar});

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<BaseLayout> {
  DateTime? currentBackPressTime;

  // 뒤로가기 두 번 누르면 앱 종료 alert
  Future<bool> closeAppAction() async {
    DateTime dateNow = DateTime.now();
    if (currentBackPressTime == null ||
        dateNow.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = dateNow;
      return (await closeDialog()) ?? Future.value(false);
    }
    return Future.value(true);
  }

  // 앱 종료 다이얼그램
  Future<dynamic> closeDialog() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Text('종료'),
        content: Text('앱을 종료하시겠습니까?'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('아니오')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('네')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: SafeArea(
          child: widget.body,
        ),
        onWillPop: Platform.isAndroid ? closeAppAction : null,
      ),
      bottomNavigationBar: widget.bottomBar,
    );
  }
}
