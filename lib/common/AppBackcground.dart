import 'package:flutter/material.dart';
import 'package:ux/styleguide/colors.dart';

class AppBackground extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;
AppBackground({this.firstColor ,this.secondColor,this.thirdColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final height = constraint.maxHeight;
      final width = constraint.maxWidth;

      return Stack(
        children: <Widget>[
          Container(color: backgroundColor),
          Positioned(
            left: -(height/2 - width/2),
            bottom: height * 0.25,
            child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: firstColor),
                height: height,
                width: height),
          ),
           Positioned(
            left: width * 0.15,
            top: -width * 0.5,
            child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: secondColor),
                height: width * 1.6,
                width: width * 1.6),
          ),
          Positioned(
            right: -width * 0.2,
            top: -50,
            child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: thirdColor),
                height: width * 0.6,
                width: width * 0.6),
          )
        ],
      );
    });
  }
}
