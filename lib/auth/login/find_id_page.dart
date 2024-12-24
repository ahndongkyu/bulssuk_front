import 'package:flutter/material.dart';

class FindIdPage extends StatefulWidget {
  @override
  _FindIdPageState createState() => _FindIdPageState();
}

class _FindIdPageState extends State<FindIdPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isNameEmpty = false;
  bool _isEmailEmpty = false;

  void _findId() {
    setState(() {
      _isNameEmpty = _nameController.text.isEmpty;
      _isEmailEmpty = _emailController.text.isEmpty;
    });

    if (!_isNameEmpty && !_isEmailEmpty) {
      // 아이디 정보를 보여주는 창 띄우기
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('아이디 정보'),
            content: Text('찾은 아이디: example_user_id'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // 다이얼로그 닫기
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
          '아이디 찾기',
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
            // 이름 입력 필드
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: '이름 입력',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: _isNameEmpty ? '이름을 입력해주세요.' : null,
              ),
            ),
            SizedBox(height: 20),
            // 이메일 입력 필드
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: '이메일 입력',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: _isEmailEmpty ? '이메일을 입력해주세요.' : null,
              ),
            ),
            SizedBox(height: 30),
            // 확인 버튼
            ElevatedButton(
              onPressed: _findId,
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
                  '로그인 페이지로 돌아가기',
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