import 'package:clone_netflix/layout/base_layout.dart';
import 'package:clone_netflix/layout/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  /* profile Image Widget */
  Widget profileImage() {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: CircleAvatar(
        radius: 80.0,
        backgroundImage: AssetImage('images/netflix_logo.png'),
      ),
    );
  }

  Widget linkSiteBtn() {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Linkify(
            onOpen: (link) async {
              if (await canLaunch(link.url)) {
                await launch(link.url);
              }
            },
            text: 'https://github.com/bongguma',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            linkStyle: TextStyle(color: Colors.white)));
  }

  /* 가입 유저 데이터 출력 widget */
  Widget userDataWidget() {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Text(
        'bongguma',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
      ),
    );
  }

  /* profile modify widget */
  Widget modifyProfileBtn() {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
      ),
      icon: Icon(Icons.edit, color: Colors.white),
      label: Text(
        '프로필 수정하기',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      isCloseApp: true,
      body: Center(
        child: Column(
          children: [
            profileImage(),
            userDataWidget(),
            Container(
              padding: EdgeInsets.all(15.0),
              width: 140.0,
              height: 5.0,
              color: Colors.red,
            ),
            linkSiteBtn(),
            modifyProfileBtn(),
          ],
        ),
      ),
      bottomBar: BottomBar(),
    );
  }
}
