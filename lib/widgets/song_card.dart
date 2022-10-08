import 'package:flutter/material.dart';
import 'package:fy/utils/colors.dart';

class SongCard extends StatelessWidget {
  const SongCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: MediaQuery.of(context).size.height * (1/10),
        width: MediaQuery.of(context).size.width * 0.9,
        color: Colors.grey.shade900
      ),
    );
  }
}