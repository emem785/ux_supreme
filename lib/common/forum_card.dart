import 'package:flutter/material.dart';
import '../model/forum.dart';

class ForumCard extends StatelessWidget {
  final Forum forum;
  ForumCard({this.forum});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Card(
        elevation: 20.0,
        margin: EdgeInsets.symmetric(vertical: 45.0, horizontal: 25.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: ClipRRect(child: Stack(children: <Widget>[Image.asset(forum.imagePath, fit: BoxFit.fill)],),borderRadius: BorderRadius.all(Radius.circular(20.0)),),
      ),
    );
  }
}
