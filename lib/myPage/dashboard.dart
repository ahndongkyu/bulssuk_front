import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원 대시보드'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          '환영합니다! 회원 대시보드입니다.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}