import 'package:flutter/material.dart';
import '../widgets/top_nav.dart'; // 상단 네비게이션 가져오기
import '../widgets/bottom_nav.dart'; // 하단 네비게이션 가져오기

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigationSection(), // 상단 네비게이션
      body: Center(
        child: Text(
          'HOME',
          style: TextStyle(fontSize: 24), // 본문 텍스트 크기
        ),
      ),
      bottomNavigationBar: BottomNavigationSection(), // 하단 네비게이션 바
    );
  }
}
