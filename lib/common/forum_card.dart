import 'package:flutter/material.dart';
import '../model/forum.dart';
import '../common/forum_name_widget.dart';
import '../common/forum_details.dart';
import '../Pages/DetailsPage.dart';

class ForumCard extends StatelessWidget {
  final Forum forum;
  ForumCard({this.forum});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(forum: forum)));},
      child: SizedBox(
        width: 280,
        child: Card(
          elevation: 20.0,
          margin: EdgeInsets.symmetric(vertical: 45.0, horizontal: 25.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: ClipRRect(
            child: Stack(
              children: <Widget>[
                Image.asset(forum.imagePath, fit: BoxFit.fill),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: ForumDetails(
                    forum: forum,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 80.0,
                  child: ForumName(
                    forum: forum,
                  ),
                ),              
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }
}
