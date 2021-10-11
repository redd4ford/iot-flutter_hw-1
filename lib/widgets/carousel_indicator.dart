import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final List<Color> cardColors;
  final int numberOfCards;
  final int index;

  const CarouselIndicator(
      {Key? key,
      this.cardColors = const [
        Color.fromRGBO(39, 51, 63, 1.0),
        Color.fromRGBO(44, 39, 35, 1.0),
        Color.fromRGBO(52, 42, 50, 1.0),
        Color.fromRGBO(27, 64, 80, 1.0),
        Color.fromRGBO(35, 44, 51, 1.0),
      ],
      this.numberOfCards = 0,
      this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    var centerColumnWidth = size.width / 10;
    var carouselIndicatorWidth =
        size.height / (size.height / size.width * 2.25);

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: orientation == Orientation.portrait
                ? centerColumnWidth * 4
                : carouselIndicatorWidth),
        child: GridView.builder(
          itemCount: numberOfCards,
          itemBuilder: (_, i) => Container(
            decoration: BoxDecoration(
                color: i == index ? Colors.black : cardColors[index],
                shape: BoxShape.circle),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: numberOfCards,
            crossAxisSpacing: numberOfCards.toDouble(),
          ),
        ),
      ),
    );
  }
}
