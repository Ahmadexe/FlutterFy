import 'package:flutter/material.dart';
import 'package:fy/utils/colors.dart';

class SongCard extends StatelessWidget {
  final String header;
  final String desc;
  const SongCard({required this.header,required this.desc,super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),),
          Text(desc, style: const TextStyle(fontSize: 16,color: Colors.grey)),
          const Divider(color: secondaryColor,),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}