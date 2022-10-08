import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fy/screens/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MobileMain extends StatefulWidget {
  const MobileMain({super.key});

  @override
  State<MobileMain> createState() => _MobileMainState();
}

class _MobileMainState extends State<MobileMain> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [HomeScreen()],
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        color: Colors.grey,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey.shade800,
        gap: 8,
        onTabChange: (index) {
          _pageController.jumpToPage(index);
        },
        tabs: const [
          GButton(
            icon: CupertinoIcons.home,
            text: 'Home',
          ),
          GButton(
            icon: CupertinoIcons.search,
            text: 'Search',
          ),
          GButton(
            icon: CupertinoIcons.music_albums,
            text: 'Albums',
          ),
          GButton(
            icon: CupertinoIcons.profile_circled,
            text: 'Developer',
          ),
        ],
      ),
    );
  }
}
