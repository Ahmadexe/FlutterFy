import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final String image;
  final String title;
  final Function onPressed;
  const GenreCard({required this.image,required this.title, required this.onPressed ,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
              height: 110,
              width: 180,
              child: Image.asset(
                'assets/images/$image',
                fit: BoxFit.fill,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
                height: 110,
                width: 180,
                color: Colors.black26,
                child: Center(
                  child: Text("${title[0].toUpperCase()}${title.substring(1).toLowerCase()}",
                      style: const TextStyle(color: Colors.white, fontSize: 18)),
                )),
          )
        ],
      ),
    );
  }
}