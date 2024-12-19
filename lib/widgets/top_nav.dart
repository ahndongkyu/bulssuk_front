import 'package:flutter/material.dart';

class TopNavigationSection extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '상단 노치 영역', // 제목 텍스트
        style: TextStyle(
          color: Colors.white, // 텍스트 색상
          fontSize: 18, // 텍스트 크기
        ),
      ),
      backgroundColor: Colors.black, // AppBar 배경색
      centerTitle: true, // 텍스트 중앙 정렬
      elevation: 0, // 그림자 제거
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.0); // AppBar 높이 설정
}