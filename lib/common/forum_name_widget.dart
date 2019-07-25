import 'package:flutter/material.dart';
import 'package:ux/styleguide/colors.dart';
import 'package:ux/styleguide/text_styles.dart';
import '../model/forum.dart';

class ForumName extends StatelessWidget {
  final Forum forum;

  ForumName({this.forum});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CustomBorder(),
      color: primaryColor,
      elevation: 20.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0,18.0,24.0,10.0),
        child: Text(
          
          forum.title,
          style: forumNameTextStyle,
        ),
      ),
    );
  }
  
}

class CustomBorder extends ShapeBorder{

  final double wallSpace = 12.0;
  final double controlPoint = 2.0;
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    
    return getClip(Size(150.0,60.0));
      }
    
      @override
      void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
        // TODO: implement paint
      }
    
      @override
      ShapeBorder scale(double t) {
        // TODO: implement scale
        return null;
      }
    
      Path getClip(Size size) {

        Path clippedPath = Path();

        clippedPath.moveTo(wallSpace , 0);

        clippedPath.quadraticBezierTo(controlPoint, controlPoint, 0, wallSpace);
        clippedPath.lineTo(0, size.height - wallSpace);
        clippedPath.quadraticBezierTo(controlPoint, size.height- controlPoint , wallSpace, size.height);
        clippedPath.lineTo(size.width - wallSpace, size.height);
        clippedPath.quadraticBezierTo(size.width - controlPoint, size.height - controlPoint, size.width, size.height - wallSpace);
        clippedPath.lineTo(size.width, size.height * 0.6);
        clippedPath.quadraticBezierTo(size.width - 1, size.height * 0.6 - wallSpace, size.width - wallSpace, size.height * 0.6 - wallSpace - 3);
        
        clippedPath.close();

        
        return clippedPath;
      }
}
