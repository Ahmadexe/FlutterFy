import 'package:flutter/material.dart';
import 'package:fy/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackground,
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: mobileBackground,
        title: Row(
          children: const [
            Text("Welcome "),
            Text(
              "Ahmad",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
