import 'package:flutter/cupertino.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('images/netflix_logo.png',
              fit: BoxFit.contain, height: 25),
          Container(
            padding: EdgeInsets.only(right: 1.0),
            child: Text('TV 프로그램', style: TextStyle(fontSize: 14.0)),
          ),
          Container(
            padding: EdgeInsets.only(right: 1.0),
            child: Text('영화', style: TextStyle(fontSize: 14.0)),
          ),
          Container(
            padding: EdgeInsets.only(right: 1.0),
            child: Text('내가 찜한 콘텐츠', style: TextStyle(fontSize: 14.0)),
          )
        ],
      ),
    );
  }
}