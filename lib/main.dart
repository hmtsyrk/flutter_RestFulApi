import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'src/home_page.dart';

void main() => runApp(FlutterRest());

class FlutterRest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NodeJS Restful App",
      home: HomePage(),
    );
  }
}

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   SharedPreferences sharedPreference;

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
