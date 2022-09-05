import 'package:flutter/material.dart';

class BottomNaviBarItem extends StatefulWidget {
  const BottomNaviBarItem({Key? key}) : super(key: key);

  @override
  State<BottomNaviBarItem> createState() => _BottomNaviBarItemState();
}

class _BottomNaviBarItemState extends State<BottomNaviBarItem> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
            backgroundColor: Colors.blue,
            activeIcon: Icon(Icons.home_filled)),
        BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: '샵',
            activeIcon: Icon(Icons.shop_2_outlined)),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
            activeIcon: Icon(Icons.search_off)),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내정보',
            activeIcon: Icon(Icons.person_outline)),
      ],
    );
  }
}
