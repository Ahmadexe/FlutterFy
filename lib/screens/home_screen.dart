import 'package:flutter/material.dart';
import 'package:fy/database/databse_helper.dart';
import 'package:fy/utils/colors.dart';
import 'package:fy/widgets/channel_text.dart';
import 'package:fy/widgets/genre_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Map<String, dynamic>> channels;
  bool _loading = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      _loading = true;
    });
    channels = await DatabaseHelper.instance.queryAll();
    setState(() {
      _loading = false;
    });
    print(channels.length);
  }

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
            Text("Welcome ", style: TextStyle(fontSize: 24),),
            Text(
              "Ahmad",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
            const SizedBox(height: 70,),
            Row(
              children: const [
                Text("Famous",style: TextStyle(color: Colors.white, fontSize: 24),),
                Text(" Channels", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),)
              ],
            ),
            const SizedBox(height: 20,),
            Padding(padding: const EdgeInsets.all(8),
            child: 
            _loading?
            const Center(child: CircularProgressIndicator(color: Colors.white,),)
            :
            channels.isEmpty?
            Center(child: Column(
              children: const [
              SizedBox(height: 50),
                Text("No channels to display.", style: TextStyle(color: Colors.white),),
              ],
            ))
            : 
            ListView.builder(
              itemCount: channels.length,
              itemBuilder: (context, index) {
                return ChannelText(text: channels[index]['name'], url: channels[index]['url'],);   
              }),
            )
          ],
        ),
      ),
    );
  }
}
