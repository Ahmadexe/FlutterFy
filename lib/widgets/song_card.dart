import 'package:flutter/material.dart';
import 'package:fy/screens/play_screen.dart';
import 'package:fy/utils/colors.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongCard extends StatefulWidget {
  final String header;
  final String desc;
  final String? uri;
  final List<SongModel> songs;
  final int index;
  const SongCard(
      {required this.songs,
      required this.index,
      required this.uri,
      required this.header,
      required this.desc,
      super.key});

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  final AudioPlayer _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PlayScreen(index: widget.index, songs: widget.songs));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.header,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Text(widget.desc,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const Divider(
              color: secondaryColor,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
