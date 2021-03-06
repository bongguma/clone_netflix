import 'package:clone_netflix/screen/like_screen.dart';
import 'package:clone_netflix/screen/netflix_main.dart';
import 'package:clone_netflix/screen/profile_screen.dart';
import 'package:clone_netflix/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  /* 타입에 맞는 화면이동 */
  movePage(String type) {
    switch (type) {
      case 'HOME':
        Get.offAll(NetflixMain());
        break;
      case 'LATER':
        Get.offAll(LikeScreen());
        break;
      case 'SEARCH':
        Get.offAll(SearchScreen());
        break;
      case 'SAVE':
        Get.offAll(ProfileScreen());
        break;
    }
  }

  /* NavigtaionBar item 디자인 */
  Widget bottomNaviBarItem(type, iconData, title) {
    return Expanded(
      flex: 40,
      child: GestureDetector(
        onTap: () {
          /* 화면이동 */
          movePage(type);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: iconData.toString().isEmpty ? false : true,
              child: Icon(
                iconData,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 9.0, color: Color(0xFF6F6F6F)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          bottomNaviBarItem('HOME', Icons.home, '홈'),
          bottomNaviBarItem('LATER', Icons.home, '내가 찜한 콘텐츠'),
          bottomNaviBarItem('SEARCH', Icons.search, '검색'),
          bottomNaviBarItem('SAVE', Icons.arrow_downward_rounded, '저장한 콘텍츠 목록'),
        ],
      ),
    );
  }
}
