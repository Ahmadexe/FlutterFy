import 'package:flutter/material.dart';
import 'package:fy/utils/colors.dart';
import 'package:just_audio/just_audio.dart';

class SongCard extends StatefulWidget {
  final String header;
  final String desc;
  final String? uri;
  const SongCard({required this.uri, required this.header,required this.desc,super.key});

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {

  final AudioPlayer _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () async {
        await _player.setAudioSource(AudioSource.uri(Uri.parse(widget.uri!)));
        await _player.play();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.header, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),),
            Text(widget.desc, style: const TextStyle(fontSize: 16,color: Colors.grey)),
            const Divider(color: secondaryColor,),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}