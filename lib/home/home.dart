import 'package:flutter/material.dart';
import 'recyclingGuide/reupcycling_page.dart';
import 'recyclingGuide/recyclingMenu_page.dart';
import '../../widgets/top_nav.dart'; // 공통 AppBar 위젯 import
import '../../widgets/bottom_nav.dart'; // 하단 네비게이션 가져오기
import '../../home/environmentNews/wordCloud.dart'; // 올바른 경로로 수정


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigationSection(
        title: '',
        backgroundColor: Color(0xFFB0F4E6), // 홈 화면의 AppBar 색상
      ),
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
                  // 텍스트와 아이콘 배치
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // 위쪽 정렬
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
                        'assets/tree2.png', // 이미지 경로
                        width: 68, // 이미지 너비
                        height: 68, // 이미지 높이
                        fit: BoxFit.cover, // 이미지 비율 유지
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), // 간격 추가
                  // 버튼 영역
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // 오늘의 퀴즈 버튼
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFCF9EC), // 버튼 배경색
                          foregroundColor: Colors.black, // 버튼 글자색
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16), // 버튼 모서리 둥글기
                          ),
                        ),
                        child: const Text('오늘의 퀴즈'),
                      ),
                      // 출첵하기 버튼
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFCF9EC), // 버튼 배경색
                          foregroundColor: Colors.black, // 버튼 글자색
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

            // 2. news 영역
            GestureDetector(
              onTap: () {
                // 클릭됨 메시지 출력
                print('오늘의 환경 뉴스 클릭됨');

                // WordCloud 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Wordcloud(), // Wordcloud 페이지 호출
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '오늘의 환경 뉴스',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // 텍스트 색상
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.looks_one),
              title: const Text('“불황엔 쓰레기도 숲”... 노인들 폐지 쟁탈전'),
              onTap: () {},
            ),
            const Divider(), // 구분선

            // 3. AI 영역
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 좌측 정렬
                children: [
                  const Text(
                    '이 쓰레기 어떻게 버리지?',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'AI한테 물어보기!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center, // 아이콘만 중앙 정렬
                    child: GestureDetector(
                      onTap: () {
                        // 이미지 클릭 액션
                      },
                      child: const Icon(
                        Icons.image,
                        size: 60,
                        color: Color(0xFF12D3CF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),

            // 4. guide 영역
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '분리수거 가이드',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3, // 한 줄에 3개의 항목
                shrinkWrap: true, // GridView가 Column 내에서 높이를 자동으로 조절하도록 설정
                physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
                children: [
                  _buildGuideItemWithImage(context, '종이', 'assets/paper.png', () {
                    print('종이 클릭됨');
                  }),
                  _buildGuideItemWithImage(context, '종이팩', 'assets/paper_pack.png', () {
                    print('종이팩 클릭됨');
                  }),
                  _buildGuideItemWithImage(context, '금속캔', 'assets/can.png', () {
                    print('금속캔 클릭됨');
                  }),
                  _buildGuideItemWithImage(context, '유리', 'assets/glass.png', () {
                    print('유리 클릭됨');
                  }),
                  _buildGuideItemWithImage(context, '비닐', 'assets/binil.png', () {
                    print('비닐 클릭됨');
                  }),
                  _buildGuideItemWithImage(context, '페트병', 'assets/pet.png', () {
                    print('페트병 클릭됨');
                  }),
                  _buildGuideItemWithImage(context, '플라스틱', 'assets/plastic.png', () {
                    print('플라스틱 클릭됨');
                  }),
                  _buildGuideItemWithImage(context, '스티로폼', 'assets/styrofoam.png', () {
                    print('스티로폼 클릭됨');
                  }),
                  _buildGuideItemWithImage(context, '기타', 'assets/trashcan.png', () {
                    print('기타 클릭됨');
                  }),
                ],
              ),
            ),

            const Divider(),

            // 5. reupcycling 영역 (가로 스크롤)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '리사이클링, 업사이클링 기업',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecyclingCard(context, '플라스틱 방앗간', 'assets/plastic_bag.png'),
                  _buildRecyclingCard(context, '119REO', 'assets/119reo.jpg'),
                  _buildRecyclingCard(context, 'seedkeeper', 'assets/seedkeeper.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationSection(currentIndex: 0), // 하단 네비게이션 바
    );
  }

  // 분리수거 가이드 아이템 위젯
  Widget _buildGuideItemWithImage(BuildContext context, String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecyclingMenuPage(title: title), // const 제거
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 100, // 둥근 네모의 너비
            height: 100, // 둥근 네모의 높이
            decoration: BoxDecoration(
              color: Colors.white, // 네모의 배경색
              borderRadius: BorderRadius.circular(12), // 모서리를 둥글게
              border: Border.all( // 테두리 추가
                color: const Color(0xFF67EACA), // 테두리 색상 설정
                width: 2, // 테두리 두께
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.1 * 255).toInt()),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0), // 이미지와 네모 박스의 경계 사이 패딩
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12), // 이미지도 둥근 네모에 맞게 자르기
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // 이미지가 네모에 맞게 들어가도록 설정
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // 리사이클링 카드 위젯
  Widget _buildRecyclingCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReupcyclingPage()), // ReupcyclingPage로 이동
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFFCF9EC),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.1 * 255).toInt()),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 80, fit: BoxFit.cover),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
