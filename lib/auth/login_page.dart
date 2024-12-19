import 'package:flutter/material.dart';
import 'agreement_page.dart'; // 약관 동의 페이지 import

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoginFailed = false; // 로그인 실패 상태

  void _login() {
    // 간단한 로그인 검증 로직
    if (_emailController.text != "test@example.com" ||
        _passwordController.text != "password") {
      setState(() {
        _isLoginFailed = true; // 로그인 실패 상태로 설정
      });
    } else {
      setState(() {
        _isLoginFailed = false; // 로그인 성공
      });
      print("로그인 성공!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '상단 노치 영역',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18, // 상단 제목 텍스트 크기
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 이미지 자리
            SizedBox(
              height: 200,
              child: Placeholder(), // 이미지 대신 자리 잡기
            ),
            SizedBox(height: 40),
            // 이메일 입력 필드
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: '아이디 입력',
                errorText: _isLoginFailed
                    ? '등록되지 않은 아이디 이거나, 아이디가 올바르지 않습니다.'
                    : null, // 오류 메시지
              ),
            ),
            SizedBox(height: 20),
            // 비밀번호 입력 필드
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호 입력',
                errorText: _isLoginFailed
                    ? '아이디 또는 비밀번호가 일치하지 않습니다.'
                    : null, // 오류 메시지
              ),
            ),
            SizedBox(height: 30),
            // 로그인 버튼
            // 로그인 버튼
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB0F4E6), // 버튼 내부 색상
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Color(0xFF67EACA), width: 1), // 테두리 색상 및 두께
                ),
              ),
              child: Text(
                '로그인',
                style: TextStyle(
                  color: Color(0xFF12D3CF), // 텍스트 색상
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20), // 버튼과 다음 요소 간 여백

            // 하단 링크
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    print("아이디/비밀번호 찾기 클릭");
                  },
                  child: Text(
                    '아이디 / 비밀번호 찾기',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgreementPage()), // 약관 동의 페이지로 이동
                    );
                  },
                  child: Text(
                    '회원가입',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}