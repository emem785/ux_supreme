import 'package:flutter/material.dart';
import 'package:ux/styleguide/text_styles.dart';

class Tabtext extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTabTap;

  Tabtext({this.text, this.isSelected = false, this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: -1.58,
        child: InkWell(
          child: AnimatedDefaultTextStyle(
            style: isSelected ? selectedTabStyle : defaultTabStyle,
            duration: const Duration(milliseconds: 500),
            child: Text(text,
                 ),
          ),
          onTap: onTabTap,
        ));
  }
}
