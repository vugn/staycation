import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final ValueChanged<int> currentIndex;
  final index;
  const BottomNavBar({Key? key, required this.currentIndex, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      elevation: 1,
      onTap: currentIndex,
      backgroundColor: Colors.white,
      fixedColor: Color(0xFF3252DF),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Inbox"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
