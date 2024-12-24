import 'package:flutter/material.dart';

class FindPasswordPage extends StatefulWidget {
  @override
  _FindPasswordPageState createState() => _FindPasswordPageState();
}

class _FindPasswordPageState extends State<FindPasswordPage> {
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();

  bool _isIdEmpty = false;
  bool _isEmailEmpty = false;
  bool _isCodeEmpty = false;

  void _sendVerificationCode() {
    if (_emailController.text.isNotEmpty) {
      // 이메일 인증 로직 추가
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("인증 코드가 이메일로 발송되었습니다.")),
      );
    } else {
      setState(() {
        _isEmailEmpty = true;
      });
    }
  }

  void _verifyCode() {
    if (_codeController.text.isNotEmpty) {
      // 인증번호 확인 로직 추가
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("인증이 완료되었습니다.")),
      );
    } else {
      setState(() {
        _isCodeEmpty = true;
      });
    }
  }

  void _findPassword() {
    setState(() {
      _isIdEmpty = _idController.text.isEmpty;
      _isEmailEmpty = _emailController.text.isEmpty;
      _isCodeEmpty = _codeController.text.isEmpty;
    });

    if (!_isIdEmpty && !_isEmailEmpty && !_isCodeEmpty) {
      // 비밀번호 찾기 처리 로직
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('비밀번호 찾기'),
            content: Text('비밀번호 찾기 요청이 완료되었습니다.'),
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
          '비밀번호 찾기',
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
            // 아이디 입력 필드
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: '아이디 입력',
                labelStyle: TextStyle(
                  color: Colors.black, // 라벨 텍스트 색상 검은색
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // 둥근 테두리
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFFCCCCCC), // 비활성화 상태 테두리 색상
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xFF67EACA), // 활성화 상태 테두리 색상
                    width: 2, // 테두리 두께
                  ),
                ),
                errorText: _isIdEmpty ? '아이디를 입력해주세요.' : null,
              ),
            ),
            SizedBox(height: 20),

// 이메일 입력 필드 + 인증 버튼
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: '이메일 입력',
                      labelStyle: TextStyle(
                        color: Colors.black, // 라벨 텍스트 색상 검은색
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // 둥근 테두리
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFFCCCCCC), // 비활성화 상태 테두리 색상
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFF67EACA), // 활성화 상태 테두리 색상
                          width: 2, // 테두리 두께
                        ),
                      ),
                      errorText: _isEmailEmpty ? '이메일을 입력해주세요.' : null,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _sendVerificationCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB0F4E6), // 버튼 색상
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    '인증',
                    style: TextStyle(
                      color: Colors.black, // 버튼 텍스트 색상
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

// 인증번호 입력 필드 + 확인 버튼
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _codeController,
                    decoration: InputDecoration(
                      labelText: '인증번호 입력',
                      labelStyle: TextStyle(
                        color: Colors.black, // 라벨 텍스트 색상 검은색
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // 둥근 테두리
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFFCCCCCC), // 비활성화 상태 테두리 색상
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFF67EACA), // 활성화 상태 테두리 색상
                          width: 2, // 테두리 두께
                        ),
                      ),
                      errorText: _isCodeEmpty ? '인증번호를 입력해주세요.' : null,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _verifyCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB0F4E6), // 버튼 색상
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    '확인',
                    style: TextStyle(
                      color: Colors.black, // 버튼 텍스트 색상
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // 찾기 버튼
            ElevatedButton(
              onPressed: _findPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB0F4E6), // 버튼 색상
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Color(0xFF67EACA), width: 1), // 테두리 색상 및 두께
                ),
              ),
              child: Text(
                '비밀번호 찾기',
                style: TextStyle(
                  color: Colors.black, // 텍스트 색상
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