import 'package:flutter/material.dart';

class SignUpInputPage extends StatefulWidget {
  @override
  _SignUpInputPageState createState() => _SignUpInputPageState();
}

class _SignUpInputPageState extends State<SignUpInputPage> {
  String? _selectedYear;
  String? _selectedMonth;
  String? _selectedDay;

  final List<String> years = List.generate(2024 - 1950 + 1, (index) => '${1950 + index}');
  final List<String> months = List.generate(12, (index) => '${index + 1}');
  final List<String> days = List.generate(31, (index) => '${index + 1}');

  String? _selectedEmailDomain;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _customDomainController = TextEditingController();
  final TextEditingController _authCodeController = TextEditingController(); // 인증번호 입력 컨트롤러

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

            // 생년월일 선택
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: _selectedYear,
                    items: years.map((year) {
                      return DropdownMenuItem(
                        value: year,
                        child: Text(year),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedYear = value;
                      });
                    },
                    decoration: InputDecoration(labelText: '출생 연도'),
                    isDense: true,
                    menuMaxHeight: 200, // 드롭다운 5개씩 표시
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField<String>(
                    value: _selectedMonth,
                    items: months.map((month) {
                      return DropdownMenuItem(
                        value: month,
                        child: Text(month),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedMonth = value;
                      });
                    },
                    decoration: InputDecoration(labelText: '월'),
                    isDense: true,
                    menuMaxHeight: 200, // 드롭다운 5개씩 표시
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField<String>(
                    value: _selectedDay,
                    items: days.map((day) {
                      return DropdownMenuItem(
                        value: day,
                        child: Text(day),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDay = value;
                      });
                    },
                    decoration: InputDecoration(labelText: '일'),
                    isDense: true,
                    menuMaxHeight: 200, // 드롭다운 5개씩 표시
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // 이메일 입력
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
                          _customDomainController.clear(); // 직접 입력 초기화
                        }
                      });
                    },
                    decoration: InputDecoration(labelText: '도메인 선택'),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _showAuthCodeDialog(); // 인증번호 입력창 표시
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 48), // 버튼 크기 설정 (중복 확인과 동일)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // radius 수정 가능
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

            // 아이디 입력
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
                    print('아이디 중복 확인 버튼 클릭');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Color(0xFFB0F4E6),
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
    );
  }
}