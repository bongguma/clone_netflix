import 'package:clone_netflix/model/movieData_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:get/get.dart';

class DetailScreen extends StatefulWidget{

  const DetailScreen({Key? key}) : super(key: key);


  @override
  _DetailState createState() => _DetailState();
}


class _DetailState extends State<DetailScreen> {
  var movieData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    movieData = Get.parameters['title'];
    print('movieData :: ' + movieData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        // TODO: 무비 poster 불러오기-
                        image: AssetImage(''),
                        fit: BoxFit.cover,
                      )
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}