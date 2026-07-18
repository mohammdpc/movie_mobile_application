import 'package:flutter/material.dart';

class ScreenshotsCard extends StatelessWidget {
  final String image;
  const ScreenshotsCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: Image.network(image),
    );
  }
}
