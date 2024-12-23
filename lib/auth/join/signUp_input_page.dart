import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpInputPage extends StatefulWidget {
  @override
  _SignUpInputPageState createState() => _SignUpInputPageState();
}

class _SignUpInputPageState extends State<SignUpInputPage> {
  String? _selectedYear;
  String? _selectedMonth;
  String? _selectedDay;

  final List<String> years =
  List.generate(2024 - 1950 + 1, (index) => '${1950 + index}');
  final List<String> months = List.generate(12, (index) => '${index + 1}');
  final List<String> days = List.generate(31, (index) => '${index + 1}');

  String? _selectedEmailDomain;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _customDomainController = TextEditingController();
  final TextEditingController _authCodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  final List<String> emailDomains = ['직접 입력', 'naver.com', 'daum.net'];

  @override
  void initState() {
    super.initState();
    _selectedEmailDomain = emailDomains.first; // 기본값 설정
  }

  void _showAuthCodeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('인증번호 입력'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('인증번호를 입력해주세요.'),
              SizedBox(height: 10),
              TextField(
                controller: _authCodeController,
                decoration: InputDecoration(
                  labelText: '인증번호',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('취소'),
            ),
            ElevatedButton(
              onPressed: () {
                final authCode = _authCodeController.text;
                print('입력된 인증번호: $authCode');
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _submitSignUp() async {
    final name = _nameController.text;
    final userId = _idController.text;
    final email =
        '${_emailController.text}@${_selectedEmailDomain == '직접 입력' ? _customDomainController.text : _selectedEmailDomain}';
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (_selectedYear == null || _selectedMonth == null || _selectedDay == null) {
      _showErrorDialog('생년월일을 모두 선택해주세요.');
      return;
    }

    final birthDate = '$_selectedYear-${_selectedMonth?.padLeft(2, '0')}-${_selectedDay?.padLeft(2, '0')}';

    if (password.isEmpty || confirmPassword.isEmpty) {
      _showErrorDialog('비밀번호를 입력해주세요.');
      return;
    }
    if (password != confirmPassword) {
      _showErrorDialog('비밀번호가 일치하지 않습니다.');
      return;
    }

    final Map<String, dynamic> requestBody = {
      'user_id': userId,
      'user_pw': password,
      'user_email': email,
      'user_name': name,
      'user_birth': birthDate,
    };

    print('Request Body: $requestBody');

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/sign_up'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      print('응답 상태 코드: ${response.statusCode}');
      print('응답 본문: ${response.body}');

      // 응답 상태 코드 범위 확인
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('회원가입 성공: ${response.body}');
        Navigator.pushNamed(context, '/mypage'); // 로그인 페이지로 이동
      } else {
        print('회원가입 실패: ${response.body}');
        _showErrorDialog('회원가입 실패: ${response.body}');
      }
    } catch (error) {
      print('네트워크 오류 발생: $error');
      _showErrorDialog('네트워크 오류가 발생했습니다. 다시 시도해주세요.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('오류'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansKR', // NotoSansKR 폰트 적용
        primaryColor: Color(0xFFB0F4E6),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('회원가입 정보 입력'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: '이름'),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  _buildDropdown('출생 연도', _selectedYear, years, (value) {
                    setState(() {
                      _selectedYear = value;
                    });
                  }),
                  SizedBox(width: 8),
                  _buildDropdown('월', _selectedMonth, months, (value) {
                    setState(() {
                      _selectedMonth = value;
                    });
                  }),
                  SizedBox(width: 8),
                  _buildDropdown('일', _selectedDay, days, (value) {
                    setState(() {
                      _selectedDay = value;
                    });
                  }),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: '이메일 입력'),
                    ),
                  ),
                  Text('@'),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: _selectedEmailDomain == '직접 입력'
                        ? TextField(
                      controller: _customDomainController,
                      decoration: InputDecoration(labelText: '도메인 입력'),
                    )
                        : DropdownButtonFormField<String>(
                      value: _selectedEmailDomain,
                      items: emailDomains.map((domain) {
                        return DropdownMenuItem(
                          value: domain,
                          child: Text(domain),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedEmailDomain = value;
                          if (value != '직접 입력') {
                            _customDomainController.clear();
                          }
                        });
                      },
                      decoration: InputDecoration(labelText: '도메인 선택'),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _showAuthCodeDialog,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Color(0xFFB0F4E6),
                    ),
                    child: Text(
                      '인증',
                      style: TextStyle(color: Color(0xFF12D3CF)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                controller: _idController,
                decoration: InputDecoration(labelText: '아이디'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: '비밀번호'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: '비밀번호 확인'),
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _submitSignUp,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xFFB0F4E6),
                  ),
                  child: Text(
                    '회원가입 완료',
                    style: TextStyle(
                      color: Color(0xFF12D3CF),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: value,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(labelText: label),
        isDense: true,
        menuMaxHeight: 200,
      ),
    );
  }
}