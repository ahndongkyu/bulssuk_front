import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordEmpty = false;
  bool _isConfirmPasswordEmpty = false;
  bool _isPasswordMismatch = false;

  void _resetPassword() {
    setState(() {
      _isPasswordEmpty = _newPasswordController.text.isEmpty;
      _isConfirmPasswordEmpty = _confirmPasswordController.text.isEmpty;
      _isPasswordMismatch = _newPasswordController.text != _confirmPasswordController.text;
    });

    if (!_isPasswordEmpty && !_isConfirmPasswordEmpty && !_isPasswordMismatch) {
      // 비밀번호 재설정 로직 추가
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('비밀번호 재설정 완료'),
            content: Text('비밀번호가 성공적으로 재설정되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // 다이얼로그 닫기
                  Navigator.pop(context); // 이전 페이지로 이동
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '비밀번호 재설정',
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
            SizedBox(height: 40),
            // 새 비밀번호 입력 필드
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '새 비밀번호 입력',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: _isPasswordEmpty ? '새 비밀번호를 입력해주세요.' : null,
              ),
            ),
            SizedBox(height: 20),
            // 새 비밀번호 확인 필드
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '새 비밀번호 확인',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: _isConfirmPasswordEmpty
                    ? '비밀번호를 다시 입력해주세요.'
                    : _isPasswordMismatch
                    ? '비밀번호가 일치하지 않습니다.'
                    : null,
              ),
            ),
            SizedBox(height: 30),
            // 확인 버튼
            ElevatedButton(
              onPressed: _resetPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB0F4E6), // 버튼 색상
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Color(0xFF67EACA), width: 1), // 테두리 색상 및 두께
                ),
              ),
              child: Text(
                '확인',
                style: TextStyle(
                  color: Color(0xFF12D3CF), // 텍스트 색상
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
            // 하단으로 돌아가기 버튼
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context); // 이전 페이지로 돌아가기
                },
                child: Text(
                  '이전 페이지로 돌아가기',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}