import 'package:flutter/material.dart';

class TopNavigationSection extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TopNavigationSection({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title, // 제목 텍스트
        style: const TextStyle(
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
  Size get preferredSize => const Size.fromHeight(40.0); // AppBar 높이 설정
}