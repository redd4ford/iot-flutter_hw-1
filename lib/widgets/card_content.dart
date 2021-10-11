import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String title;
  final String fullName;
  final String text;
  final double horizontalPadding;
  final double fontSize;
  final double iconsSize;

  const CardContent(
      {Key? key,
      this.title = 'Document',
      this.fullName = 'Lorem Ipsum',
      this.text =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      this.horizontalPadding = 0.0,
      this.fontSize = 0.0,
      this.iconsSize = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cardTitleFontSize = 28.0;
    const cardFullNameFontSize = 24.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding / 2),
          child: Text(
            title,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                fontSize: cardTitleFontSize, color: Colors.white),
          ),
        ),
        Text(
          fullName,
          textAlign: TextAlign.start,
          style: const TextStyle(
              fontSize: cardFullNameFontSize, color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding / 2),
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.more_horiz_rounded,
                size: iconsSize,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
