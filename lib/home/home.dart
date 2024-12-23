import 'package:flutter/material.dart';
// import 'reupcycling_page.dart';
// import 'recyclingMenu_page.dart';
import '../widgets/top_nav.dart'; // 상단 네비게이션 가져오기
import '../widgets/bottom_nav.dart'; // 하단 네비게이션 가져오기

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigationSection(), // 상단 네비게이션
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. event 영역
            Container(
              color: const Color(0xFFB0F4E6),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Text(
                          '불쑥과 함께 분리수거하고\n나무도 키워요!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/tree2.png',
                        width: 68,
                        height: 68,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFCF9EC),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text('오늘의 퀴즈'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFCF9EC),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text('출첵하기'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // 추가적인 UI 요소들 (뉴스, 가이드 등) 기존 코드에서 가져오기
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationSection(), // 하단 네비게이션 바
    );
  }
}