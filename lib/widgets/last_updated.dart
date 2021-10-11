import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdated extends StatelessWidget {
  final double fontSize;

  const LastUpdated({Key? key, this.fontSize = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Center(
          child: Text(
            'Дані оновлено ${DateFormat('dd.MM.yyyy о HH:mm').format(DateTime.now())}',
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
