import 'package:flutter/material.dart';
import './Pages/landingPage.dart';

void main() => runApp(UX());

class UX extends StatelessWidget {
  const UX({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flux',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LandingPage(),
    );
  }
}
