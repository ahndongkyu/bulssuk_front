import 'package:flutter/material.dart';
import 'recyclingDetail_page.dart';

class RecyclingMenuPage extends StatefulWidget {
  final String title; // 제목을 전달받을 변수

  RecyclingMenuPage({required this.title});

  @override
  _RecyclingMenuState createState() => _RecyclingMenuState();
}

class _RecyclingMenuState extends State<RecyclingMenuPage> {
  final List<String> categories = [
  "신문",
  "책자, 노트",
  "상자류",
  "주의사항",
  ];

  int? tappedIndex; // 클릭된 박스의 인덱스를 저장

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '분리수거 가이드 - ${widget.title}', // 전달받은 제목을 사용
          style: TextStyle(
            color: Colors.white, // 텍스트 색상 흰색으로 설정
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 한 줄에 3개의 박스
                  crossAxisSpacing: 8.0, // 박스 간 간격
                  mainAxisSpacing: 8.0, // 세로 간격
                  childAspectRatio: 1.5, // 박스의 가로/세로 비율
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      // 클릭 시 색상 변경
                      setState(() {
                        tappedIndex = index;
                      });

                      // 딜레이
                      await Future.delayed(const Duration(milliseconds: 200));

                      // 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecyclingDetailPage(category: categories[index]),
                        ),
                      );

                      // 색상 초기화
                      setState(() {
                        tappedIndex = null;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: tappedIndex == index
                            ? const Color(0xFFB0F4E6) // 클릭 시 색상 변경
                            : Colors.white, // 기본 배경색
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: const Color(0xFF67EACA), // 테두리 색상
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // 하단 메뉴
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 모든 아이템 간 동일한 간격 유지
        currentIndex: 0, // 현재 화면은 홈
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
