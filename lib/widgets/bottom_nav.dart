import 'package:flutter/material.dart';
import '../home/home.dart';

class BottomNavigationSection extends StatefulWidget {
  @override
  _BottomNavigationSectionState createState() =>
      _BottomNavigationSectionState();
}

class _BottomNavigationSectionState extends State<BottomNavigationSection> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // 각 탭에 따라 네비게이션
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 3:
        Navigator.pushNamed(context, '/dashboard'); // DashboardPage로 이동
        break;
      default:
        print('다른 화면으로 이동');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: '달력',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.nature),
          label: '내 나무',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '마이페이지',
        ),
      ],
    );
  }
}