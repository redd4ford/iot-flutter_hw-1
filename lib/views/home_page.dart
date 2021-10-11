import 'package:flutter/material.dart';

import 'package:hw_2/app/app_header.dart';
import 'package:hw_2/app/app_body.dart';
import 'package:hw_2/app/app_footer.dart';
import 'package:hw_2/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bgColors = [
      const Color.fromRGBO(53, 74, 101, 1.0),
      const Color.fromRGBO(60, 50, 40, 1.0),
      const Color.fromRGBO(77, 59, 73, 1.0),
      const Color.fromRGBO(27, 102, 134, 1.0),
      const Color.fromRGBO(42, 60, 74, 1.0),
    ];

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        int _index = InheritedCounter.of(context)!.get();

        return Scaffold(
          backgroundColor: bgColors[_index],
          appBar: const AppHeader(),
          body: AppBody(
            notifyParent: refresh,
          ),
          bottomNavigationBar: const AppFooter(),
        );
      },
    );
  }
}
