import 'package:flutter/material.dart';
import 'package:ux/styleguide/colors.dart';
import 'package:ux/styleguide/text_styles.dart';
import '../model/forum.dart';
import 'label_values.dart';

class ForumDetails extends StatelessWidget {
  final Forum forum;

  ForumDetails({this.forum});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: customClipper(),
      child: Container(
         padding: const EdgeInsets.only(
            left: 20.0, right: 16.0, top: 24.0, bottom: 12.0),
        height: 180.0,
        color: Colors.white,
        child: Column(
          
          children: <Widget>[
            SizedBox(height: 100.0,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LabelValueWidget(
                  value: forum.topics.length.toString(),
                  label: "topics",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.threads,
                  label: "threads",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.subs,
                  label: "subs",
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class customClipper extends CustomClipper<Path> {
  final double wallSpace = 12.0;
  final double controlPoint = 2.0;
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    final double height = size.height;
    final double width = size.width;
    final double halfHeight = size.height * 0.5;

    Path clippedPath = Path();
    clippedPath.moveTo(0, halfHeight);
    clippedPath.lineTo(0, height - wallSpace);
    clippedPath.quadraticBezierTo(
        controlPoint, height - controlPoint, wallSpace, height);
    clippedPath.lineTo(width, height);
    clippedPath.lineTo(width, 30.0);
    clippedPath.quadraticBezierTo(width - 5, 5.0, width - 35, 15.0);
    clippedPath.close();
    return clippedPath;

  
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
