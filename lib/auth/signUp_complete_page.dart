import 'package:flutter/material.dart';

class SignUpCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입 완료'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          '회원가입이 완료되었습니다!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}