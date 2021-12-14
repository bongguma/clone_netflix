import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatefulWidget {
  final Widget body;
  final Widget? bottomBar;

  const BaseLayout({required this.body, this.bottomBar});

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.body,
      ),
      bottomNavigationBar: widget.bottomBar,
    );
  }
}
