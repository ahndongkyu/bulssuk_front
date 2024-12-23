import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../auth/login/login_page.dart';
import '../widgets/top_nav.dart';
import '../widgets/bottom_nav.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  // 로그아웃 기능 구현
  Future<void> logout(BuildContext context) async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();

    // 로그아웃 성공 메시지 표시
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("로그아웃 성공!")),
    );

    // 로그인 페이지로 이동 및 스택 초기화
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigationSection(title: '마이페이지'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 사용자 정보 영역
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    '닉네임 님',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      print("프로필 편집 클릭");
                    },
                    child: const Text('프로필 편집'),
                  ),
                ],
              ),
            ),
            // 포인트 정보 카드
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: const Text('내 포인트'),
                trailing: const Text(
                  '710 p',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                onTap: () {
                  print("포인트 상세보기 클릭");
                },
              ),
            ),
            const SizedBox(height: 20),
            // 메뉴 리스트
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildMenuItem(context, '오늘의 퀴즈', () {
                  print("오늘의 퀴즈 클릭");
                }),
                _buildMenuItem(context, '나의 나무 키우기', () {
                  print("나의 나무 키우기 클릭");
                }),
                _buildMenuItem(context, '출석체크', () {
                  print("출석체크 클릭");
                }),
                _buildMenuItem(context, '1:1문의 (FAQ)', () {
                  print("FAQ 클릭");
                }),
                _buildMenuItem(context, '로그아웃', () => logout(context)),
              ],
            ),
          ],
        ),
      ),
      // 'const' 제거
      bottomNavigationBar: BottomNavigationSection(currentIndex: 3),
    );
  }

  // 메뉴 아이템 빌더 함수
  Widget _buildMenuItem(BuildContext context, String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}