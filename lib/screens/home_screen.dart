import 'package:flutter/material.dart';
import 'package:fy/utils/colors.dart';
import 'package:fy/widgets/genre_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.white,
          elevation: 10,
          onPressed: () {},
          child: const Icon(Icons.add)),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: [
                  GenreCard(image: "rap.jpg", title: "Rap", onPressed: () {}),
                  GenreCard(
                      image: "sadrap.jpg", title: "Sed", onPressed: () {}),
                  GenreCard(image: "edm.jpg", title: "EDM", onPressed: () {}),
                  GenreCard(image: "rock.jpg", title: "Rock", onPressed: () {}),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            Row(
              children: const [
                Text("Famous",style: TextStyle(color: Colors.white, fontSize: 19),),
                Text(" Channels", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 19),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
