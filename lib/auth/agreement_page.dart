import 'package:flutter/material.dart';

class AgreementPage extends StatefulWidget {
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  bool _isAllAgreed = false; // 약관 전체 동의 상태
  bool _isTermsAgreed = false; // 이용약관 동의 상태
  bool _isPrivacyAgreed = false; // 개인정보 수집 동의 상태
  bool _isTermsExpanded = false; // 이용약관 펼침 상태
  bool _isPrivacyExpanded = false; // 개인정보 수집 동의 펼침 상태

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
            // 상단 이미지
            SizedBox(
              height: 200,
              child: Placeholder(), // 이미지 자리
            ),
            SizedBox(height: 30),
            // 환영 메시지
            Text(
              '고객님 환영합니다!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            // 약관 전체 동의
            ListTile(
              leading: IconButton(
                icon: Icon(
                  _isAllAgreed
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isAllAgreed = !_isAllAgreed; // 전체 동의 상태 변경
                    _isTermsAgreed = _isAllAgreed; // 전체 동의에 따라 상태 변경
                    _isPrivacyAgreed = _isAllAgreed;
                  });
                },
              ),
              title: Text('약관 전체 동의',
              style: TextStyle(
                fontSize: 18,
              ))
            ),
            Divider(),
            // 이용약관 동의 (필수)
            ExpansionTile(
              leading: IconButton(
                icon: Icon(
                  _isTermsAgreed
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isTermsAgreed = !_isTermsAgreed; // 개별 동의 상태 변경
                    _isAllAgreed = _isTermsAgreed && _isPrivacyAgreed; // 전체 동의 상태 업데이트
                  });
                },
              ),
              title: Text('이용약관 동의(필수)',
              style: TextStyle(
                fontSize: 16,
              ),),
              trailing: Icon(
                _isTermsExpanded ? Icons.expand_less : Icons.chevron_right,
                color: Colors.black,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '여기에 이용약관 내용을 작성합니다.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isTermsExpanded = expanded;
                });
              },
            ),
            Divider(),
            // 개인정보 수집 동의 (필수)
            ExpansionTile(
              leading: IconButton(
                icon: Icon(
                  _isPrivacyAgreed
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isPrivacyAgreed = !_isPrivacyAgreed; // 개별 동의 상태 변경
                    _isAllAgreed = _isTermsAgreed && _isPrivacyAgreed; // 전체 동의 상태 업데이트
                  });
                },
              ),
              title: Text('개인정보 수집 및 이용동의(필수)',
              style: TextStyle(
                fontSize: 16,
              ),),
              trailing: Icon(
                _isPrivacyExpanded ? Icons.expand_less : Icons.chevron_right,
                color: Colors.black,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '여기에 개인정보 수집 및 이용에 대한 내용을 작성합니다.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isPrivacyExpanded = expanded;
                });
              },
            ),
            Divider(),
            SizedBox(height: 30),
            // 다음 버튼
            ElevatedButton(
              onPressed: () {
                if (_isTermsAgreed && _isPrivacyAgreed) {
                } else {
                  print("필수 약관에 동의해야 합니다.");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB0F4E6), // 버튼 내부 색상
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Color(0xFF67EACA), width: 1), // 테두리 색상
                ),
              ),
              child: Text(
                '다음',
                style: TextStyle(
                  color: Color(0xFF12D3CF), // 버튼 텍스트 색상
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}