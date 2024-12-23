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
      appBar: const TopNavigationSection(title: '마이페이지'), // 이미 centerTitle 포함
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // 수평 가운데 정렬
          children: [
            // 나의 나무 상태 정보 영역
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 세로 가운데 정렬
                crossAxisAlignment: CrossAxisAlignment.center, // 가로 가운데 정렬
                children: [
                  const Text(
                    '(이름)님',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center, // 텍스트 중앙 정렬
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/tree2.png', // 나의 나무 이미지 경로
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    '현재 나무 상태',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
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