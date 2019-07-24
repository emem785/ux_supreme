import 'package:flutter/material.dart';
import 'package:ux/model/forum.dart';
import 'package:ux/styleguide/text_styles.dart';
import '../common/tab_text.dart';
import '../common/forum_card.dart';

class HorizontalTabLayout extends StatefulWidget {
  HorizontalTabLayout({Key key}) : super(key: key);

  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -20,
            top: 0,
            bottom: 0,
            width: 110.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Tabtext(
                      text: 'Media',
                      isSelected: selectedTabIndex == 0,
                      onTabTap: () {
                        onTabTap(0);
                      }),
                  Tabtext(
                      text: 'Streamers',
                      isSelected: selectedTabIndex == 1,
                      onTabTap: () {
                        onTabTap(1);
                      }),
                  Tabtext(
                      text: 'Forum',
                      isSelected: selectedTabIndex == 2,
                      onTabTap: () {
                        onTabTap(2);
                      }),                      
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:65.0),
            child: ListView(children: <Widget>[Container(child: ForumCard(forum: fortniteForum)), Container(child: ForumCard(forum: pubgForum))],scrollDirection: Axis.horizontal,),
          )
        ],
      ),
    );
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
