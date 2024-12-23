import 'package:flutter/material.dart';
import 'home/home.dart';
import 'auth/login/login_page.dart';
import 'myPage/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seperate Recycling',
      theme: ThemeData(
        primarySwatch: Colors.green, // 기본 테마 색상 (필요시 통합 조정)
      ),
      debugShowCheckedModeBanner: false, // 디버그 배너 숨김
      initialRoute: '/login', // 앱 시작 화면을 로그인 페이지로 설정
      routes: {
        '/login': (context) => LoginPage(), // 로그인 화면 경로
        '/home': (context) => HomePage(),   // 홈 화면 경로
      },
    );
  }
}