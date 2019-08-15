import 'package:flutter/material.dart';
import 'navigator/tab_navigator.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Flutter Trip',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: TabNavigator(),
      ),
    );
  }
}


