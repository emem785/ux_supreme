import 'package:flutter/material.dart';
import 'package:ux/styleguide/colors.dart';
import 'package:ux/styleguide/text_styles.dart';
import '../common/AppBackcground.dart';
import '../common/Horizontal_tab_layout.dart';

import '../model/forum.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(firstColor: firstCircleColor,secondColor: secondCircleColor,thirdColor: thirdCircleColor,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Material(
                    color: Colors.white,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.apps, color: primaryColor),
                    ),
                    elevation: 10.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Forumn', style: headingStyle),
                    Text('Get Started', style: subHeadingStyle)
                  ],
                ),
              ),
            ],
          ),
          Align(
            child: HorizontalTabLayout(),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('New Topic', style: buttonStyle,),
              ),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(25.0))),
            ),
          ),
        ],
      ),
    );
  }
}
