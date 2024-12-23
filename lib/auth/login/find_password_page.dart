import 'package:flutter/material.dart';

class FindPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 찾기'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('비밀번호 찾기 페이지'),
      ),
    );
  }
}