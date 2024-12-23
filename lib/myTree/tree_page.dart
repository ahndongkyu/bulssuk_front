import 'package:flutter/material.dart';

class TreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('상단 노치 영역', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // 상단 여백
          // 현재 내 포인트 텍스트
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerRight, // 우측 상단에 배치
              child: Text(
                '현재 내 포인트: 0p',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20), // 간격 추가
          Text(
            '내 나무',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30), // 간격 추가
          // 상태바
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 20, // 상태바 전체 높이
              decoration: BoxDecoration(
                color: Colors.white, // 안 채워진 부분의 색상
                border: Border.all(
                  color: Color(0xFF67EACA), // 테두리 색상
                  width: 2, // 테두리 두께
                ),
                borderRadius: BorderRadius.circular(10), // 테두리 라운드 처리
              ),
              child: Stack(
                children: [
                  // 채운 부분
                  FractionallySizedBox(
                    widthFactor: 0.5, // 상태바의 반 정도 채움 (50%)
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF67EACA), // 채운 부분의 색상
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8), // 왼쪽 모서리 라운드 처리
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30), // 간격 추가
          // 텍스트 박스
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            decoration: BoxDecoration(
              color: Color(0xFFFCF9EC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '응애 나 씨앗',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 80),
          // 씨앗 이미지
          Image.asset(
            'assets/seed.png', // assets 폴더에 씨앗 이미지를 추가해야 합니다.
            height: 150,
          ),
          // 사진과 하단 버튼 사이의 간격을 10으로 설정
          // 하단 버튼들
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  label: '물주기',
                  points: '10p',
                  icon: Icons.water_drop,
                  iconColor: Colors.blue,
                ),
                ActionButton(
                  label: '햇빛쐬기',
                  points: '20p',
                  icon: Icons.wb_sunny,
                  iconColor: Colors.red,
                ),
                ActionButton(
                  label: '비료주기',
                  points: '50p',
                  icon: Icons.grass,
                  iconColor: Colors.brown,
                ),
              ],
            ),
          ),
        ],
      ),
      // 하단 메뉴
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 모든 아이템 간 동일한 간격 유지
        currentIndex: 2, // 현재 화면은 내 나무
        selectedItemColor: Colors.black, // 선택된 아이콘과 텍스트 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이콘과 텍스트 색상
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: '달력'),
          BottomNavigationBarItem(icon: Icon(Icons.nature), label: '내 나무'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final String points;
  final IconData icon;
  final Color iconColor;

  const ActionButton({
    Key? key,
    required this.label,
    required this.points,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // 고정된 너비
      height: 120, // 고정된 높이
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF67EACA)), // 테두리 색상
        borderRadius: BorderRadius.circular(10), // 테두리 라운드
      ),
      child: Stack(
        children: [
          // 카드 메인 콘텐츠
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
              crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: iconColor, // 아이콘 색상 설정
                ),
                SizedBox(height: 8), // 아이콘과 텍스트 간격
                Text(
                  label,
                  textAlign: TextAlign.center, // 텍스트 중앙 정렬
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // 우측 상단 라운드 박스
          Positioned(
            top: 8, // 위쪽 간격
            right: 8, // 오른쪽 간격
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2), // 내부 여백 추가
              width: 40, // 박스 너비
              height: 20, // 박스 높이
              alignment: Alignment.center, // 텍스트를 중앙에 배치
              decoration: BoxDecoration(
                color: Color(0xFFB0F4E6), // 배경 색상
                borderRadius: BorderRadius.circular(10), // 라운드 처리
              ),
              child: Text(
                points, // "10p" 텍스트
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}