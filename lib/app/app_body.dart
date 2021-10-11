import 'package:flutter/material.dart';
import 'package:hw_2/main.dart';

import 'package:hw_2/widgets/card_content.dart';
import 'package:hw_2/widgets/carousel_indicator.dart';
import 'package:hw_2/widgets/last_updated.dart';

class AppBody extends StatelessWidget {
  final Function() notifyParent;

  const AppBody({Key? key, required this.notifyParent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    var toolbarRowHeight =
        orientation == Orientation.portrait ? size.height / 8 : size.width / 10;
    var centerColumnWidth = size.width / 10;
    var iconsSize = orientation == Orientation.portrait
        ? toolbarRowHeight / 4
        : toolbarRowHeight / 2;
    var bodyTopPadding =
        orientation == Orientation.portrait ? iconsSize / 2 : 0.0;

    const standardTextFontSize = 14.0;

    final cardColors = [
      const Color.fromRGBO(39, 51, 63, 1.0),
      const Color.fromRGBO(44, 39, 35, 1.0),
      const Color.fromRGBO(52, 42, 50, 1.0),
      const Color.fromRGBO(27, 64, 80, 1.0),
      const Color.fromRGBO(35, 44, 51, 1.0),
    ];

    final cardTitles = [
      'Паспорт громадянина України 🇺🇦',
      'Студентський квиток',
      'Картка платника податків',
      'Закордонний паспорт',
      'Свідоцтво про народження дитини',
    ];

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        int _index = InheritedCounter.of(context)!.get();

        return Padding(
          padding: EdgeInsets.only(top: bodyTopPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: PageView.builder(
                    itemCount: cardTitles.length,
                    controller: PageController(viewportFraction: 0.85),
                    onPageChanged: (int index) => setState(() {
                      InheritedCounter.of(context)!.set(index);
                      notifyParent(); // update the background color
                    }),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          color: cardColors[_index],
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: CardContent(
                              title: cardTitles[i],
                              horizontalPadding: centerColumnWidth,
                              fontSize: standardTextFontSize,
                              iconsSize: iconsSize),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const LastUpdated(
                      fontSize: standardTextFontSize,
                    ),
                    CarouselIndicator(
                        index: _index,
                        numberOfCards: cardTitles.length,
                        cardColors: cardColors),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
