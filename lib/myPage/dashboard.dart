import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // 설정 버튼 클릭 시 동작 추가
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 닉네임 및 이미지 영역
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
                      color: Colors.grey[300], // 빈 이미지 영역 배경색
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      // "히히 나 작은 가지" 버튼 동작 추가
                    },
                    child: const Text('히히 나 작은 가지'),
                  ),
                ],
              ),
            ),
            // 포인트 영역
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: const Text('내 포인트'),
                trailing: const Text(
                  '710 p',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                onTap: () {
                  // 포인트 클릭 동작 추가
                },
              ),
            ),
            const SizedBox(height: 20),
            // 메뉴 리스트
            // 메뉴 리스트
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0), // 왼쪽 여백 추가
                  child: _buildMenuItem(context, '오늘의 퀴즈', () {
                    // FAQ 클릭 동작 추가
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0), // 왼쪽 여백 추가
                  child: _buildMenuItem(context, '나의 나무 키우기', () {
                    // 퀴즈 클릭 동작 추가
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0), // 왼쪽 여백 추가
                  child: _buildMenuItem(context, '출석체크', () {
                    // 출석체크 클릭 동작 추가
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0), // 왼쪽 여백 추가
                  child: _buildMenuItem(context, '1:1문의 (FAQ)', () {
                    // 나의 나무 키우기 클릭 동작 추가
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0), // 왼쪽 여백 추가
                  child: _buildMenuItem(context, '로그아웃', () {
                    // 로그아웃 클릭 동작 추가
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}