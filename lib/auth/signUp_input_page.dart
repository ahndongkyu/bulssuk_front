import 'package:flutter/material.dart';

class SignUpInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입 정보 입력'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이름 입력
            TextField(
              decoration: InputDecoration(labelText: '이름'),
            ),
            SizedBox(height: 16),

            // 생년월일 입력
            TextField(
              decoration: InputDecoration(labelText: '출생연도 (YYYY-MM-DD)'),
            ),
            SizedBox(height: 16),

            // 이메일 입력 (인증 버튼 포함)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: '이메일'),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // 이메일 인증 로직
                    print('이메일 인증 버튼 클릭');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB0F4E6), // 버튼 색상
                  ),
                  child: Text(
                    '인증',
                    style: TextStyle(color: Color(0xFF12D3CF)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // 아이디 입력 (중복 확인 버튼 포함)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: '아이디'),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // 아이디 중복 확인 로직
                    print('아이디 중복 확인 버튼 클릭');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB0F4E6), // 버튼 색상
                  ),
                  child: Text(
                    '중복 확인',
                    style: TextStyle(color: Color(0xFF12D3CF)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // 비밀번호 입력
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: '비밀번호'),
            ),
            SizedBox(height: 16),

            // 비밀번호 확인 입력
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: '비밀번호 확인'),
            ),
            SizedBox(height: 24),

            // 회원가입 완료 버튼
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup_complete');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB0F4E6), // 버튼 색상
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xFF67EACA), width: 1),
                  ),
                ),
                child: Text(
                  '회원가입 완료',
                  style: TextStyle(
                    color: Color(0xFF12D3CF), // 텍스트 색상
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}