import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staycation/fonts/stc_icons.dart';
import 'package:staycation/widgets/bottom_navigation_bar.dart';
import 'package:staycation/widgets/drawer.dart';
import 'package:staycation/widgets/home_page.dart';
import 'package:staycation/widgets/inbox_page.dart';
import 'package:staycation/widgets/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  PageController _pageController = PageController();

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: Drawer(child: MainDrawer(currentIndex: onItemTapped)),
        bottomNavigationBar: BottomNavBar(
          currentIndex: onItemTapped,
          index: selectedIndex,
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () => _key.currentState!.openDrawer(),
                  icon: Icon(
                    StcIcons.fries_bar,
                    color: Colors.black,
                    size: 18,
                  ));
            },
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: [HomePageSection(), InboxSection(), ProfileSection()],
        ));
  }
}
