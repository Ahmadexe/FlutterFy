import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fy/backend/duration_state.dart';
import 'package:fy/utils/colors.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rxdart/rxdart.dart';

class PlayScreen extends StatefulWidget {
  final List<SongModel> songs;
  final int index;
  const PlayScreen({required this.index, required this.songs, super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final AudioPlayer _player = AudioPlayer();
  int playing = 0;
  Stream<DurationState> get _durationStateStream =>
      Rx.combineLatest2<Duration, Duration?, DurationState>(
          _player.positionStream,
          _player.durationStream,
          (position, duration) => DurationState(
              position: position, total: duration ?? Duration.zero));

  @override
  void initState() {
    playSong(widget.index);
    setState(() {
      playing = 1;
    });
    super.initState();
  }

  playSong(int index) async {
    String? uri = widget.songs[index].uri;
    await _player.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
    await _player.play();
  }

  togglePlayPause() async {
    if (playing == 1) {
      await _player.pause();
      setState(() {
        playing = 0;
      });
    } else {
      await _player.play();
      setState(() {
        playing = 1;
      });
    }
  }

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
                const SizedBox(
                  height: 70,
                ),
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
                const SizedBox(height: 40),
                StreamBuilder<DurationState>(
                    stream: _durationStateStream,
                    builder: (context, snapshot) {
                      final durationState = snapshot.data;
                      final progress = durationState?.position ?? Duration.zero;
                      final total = durationState?.total ?? Duration.zero;

                      return ProgressBar(
                        progress: progress,
                        total: total,
                        barHeight: 2,
                        progressBarColor: Colors.white,
                        thumbColor: Colors.white,
                        baseBarColor: Colors.grey,
                        timeLabelTextStyle: const TextStyle(fontSize: 0),
                        onSeek: (duration) {
                          _player.seek(duration);
                        },
                      );
                    }),
                StreamBuilder<DurationState>(
                    stream: _durationStateStream,
                    builder: (context, snapshot) {
                      final durationState = snapshot.data;
                      final progress = durationState?.position ?? Duration.zero;
                      final total = durationState?.total ?? Duration.zero;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.star_border,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.skip_previous_rounded,
                                  color: Colors.white)),
                          const CircleAvatar(
                            backgroundColor: secondaryColor,
                            child: Icon(Icons.pause, color: Colors.white),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.skip_next_rounded,
                                  color: Colors.white)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.loop, color: Colors.white)),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
