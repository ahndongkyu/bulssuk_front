import 'package:flutter/material.dart';
import 'home/home.dart';
import 'auth/login/login_page.dart';
import 'myPage/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 로그인 상태 (테스트용: false로 설정)
  final bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(), // 홈 화면
        '/mypage': (context) =>
        isLoggedIn ? Dashboard() : LoginPage(), // 로그인 상태에 따라 다른 화면
      },
    );
  }
}