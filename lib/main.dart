import 'package:flutter/material.dart';
import 'home/home.dart';
import 'auth/login/login_page.dart';
import 'myPage/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // 앱 시작 화면을 로그인 페이지로 설정
      routes: {
        '/login': (context) => LoginPage(), // 로그인 화면 경로
        '/home': (context) => HomePage(),   // 홈 화면 경로
      },
    );
  }
}