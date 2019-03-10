import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  final String imageUri;

  const CarouselImage({Key key, this.imageUri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imageUri,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
