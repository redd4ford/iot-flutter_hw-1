import 'package:flutter/material.dart';

import 'package:hw_2/views/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дія',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InheritedCounter(child: const HomePage()),
    );
  }
}

class InheritedCounter extends InheritedWidget {
  // data structure is a map because InheritedWidgets are immutable
  final Map _counter = {'val': 0};
  // ignore: annotate_overrides, overridden_fields
  final Widget child;

  InheritedCounter({Key? key, this.child = const HomePage()})
      : super(key: key, child: child);

  set(newValue) {
    _counter['val'] = newValue;
  }

  get() {
    return _counter['val'];
  }

  get counter => _counter['val'];

  @override
  bool updateShouldNotify(InheritedCounter oldWidget) => true;

  static InheritedCounter? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
}
