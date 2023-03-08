import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required int currentBackgroundIndex,
  }) : _currentBackgroundIndex = currentBackgroundIndex;

  final int _currentBackgroundIndex;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/background_$_currentBackgroundIndex.jpg',
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black38,
      colorBlendMode: BlendMode.darken,
    );
  }
}
