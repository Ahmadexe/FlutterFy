import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fy/utils/colors.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayScreen extends StatefulWidget {
  final List<SongModel> songs;
  final int index;
  const PlayScreen({required this.index, required this.songs, super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mobileBackground,
        appBar: AppBar(
          backgroundColor: mobileBackground,
          toolbarHeight: 100,
          title: Row(children: const [
            Text(
              "Local ",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Songs",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/images/songssc.svg",
                  height: 140,
                ),
                const SizedBox(
                  height: 90,
                ),
                Center(
                  child: Text(
                    widget.songs[widget.index].title,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
