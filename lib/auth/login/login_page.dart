import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'find_id_page.dart'; // 아이디 찾기 페이지 import
import 'find_password_page.dart'; // 비밀번호 찾기 페이지 import
import '../join/agreement_page.dart'; // 회원가입 페이지 import

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _storage = const FlutterSecureStorage();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoginFailed = false; // 로그인 실패 상태

  Future<void> login() async {
    final url = Uri.parse('http://localhost:8080/user_login'); // 서버 로그인 엔드포인트
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_id': _emailController.text,
        'user_pw': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      final userId = data['userId'];

      // Secure Storage에 저장
      await _storage.write(key: 'jwt_token', value: token);
      await _storage.write(key: 'user_id', value: userId);

      // 로그인 성공 메시지
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("로그인 성공!")),
      );

      // 홈 화면으로 이동
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        _isLoginFailed = true; // 로그인 실패 상태 설정
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("로그인 실패: ${jsonDecode(response.body)['message']}")),
      );
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
            // 아이디 입력 필드
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
            ElevatedButton(
              onPressed: login, // 로그인 요청 함수
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

            // 하단 링크 (아이디 찾기 | 비밀번호 찾기 | 회원가입)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 아이디 찾기 및 비밀번호 찾기
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FindIdPage()),
                        );
                      },
                      child: Text(
                        '아이디 찾기',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Text('|', style: TextStyle(color: Colors.grey)), // 구분선
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FindPasswordPage()),
                        );
                      },
                      child: Text(
                        '비밀번호 찾기',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                // 회원가입
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgreementPage()),
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