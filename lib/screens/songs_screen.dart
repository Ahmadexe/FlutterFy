import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fy/utils/colors.dart';
import 'package:fy/widgets/song_card.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackground,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                FutureBuilder<List<SongModel>>(
                    future: _audioQuery.querySongs(
                        sortType: null,
                        orderType: OrderType.ASC_OR_SMALLER,
                        uriType: UriType.EXTERNAL,
                        ignoreCase: true),
                    builder: (context, item) {
                      if (item.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      //no songs found
                      if (item.data!.isEmpty) {
                        return const Center(
                          child: Text("No Songs Found"),
                        );
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: item.data!.length,
                          itemBuilder: (context, index) {
                            if (!item.data![index].title.contains("AUD") &&
                                !item.data![index].title.contains("tone") &&
                                !item.data![index].title.contains("Slack")) {
                              return SongCard(
                                header: item.data![index].title,
                                desc: item.data![index].displayName,
                              );
                            } else {
                              return const SizedBox();
                            }
                            // return SizedBox();
                          });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void requestPermission() async {
    if (!kIsWeb) {
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _audioQuery.permissionsRequest();
      }
    }
    setState(() {});
  }
}
