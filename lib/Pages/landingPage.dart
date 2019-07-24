import 'package:flutter/material.dart';
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
          AppBackground(),
          Align(
            child: HorizontalTabLayout(),
            alignment: Alignment.center,
          )
                  
        ],
      ),
    );
  }
}
