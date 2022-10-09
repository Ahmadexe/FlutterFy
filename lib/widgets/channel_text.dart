import 'package:flutter/material.dart';

class ChannelText extends StatelessWidget {
  final String text;
  const ChannelText({required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("#     ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
            Text(text,style: const TextStyle(color: Colors.white, fontSize: 16),),
          ],
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}