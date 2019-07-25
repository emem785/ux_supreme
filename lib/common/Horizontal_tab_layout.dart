import 'package:flutter/material.dart';
import 'package:ux/model/forum.dart';
import 'package:ux/styleguide/text_styles.dart';
import '../common/tab_text.dart';
import '../common/forum_card.dart';

class HorizontalTabLayout extends StatefulWidget {
  HorizontalTabLayout({Key key}) : super(key: key);

  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout>
    with TickerProviderStateMixin {
  int selectedTabIndex = 2;
  AnimationController _controller;
  Animation<Offset> _animation;
  Animation<double> _fadeanimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _fadeanimation = Tween<double>(begin: 0.0, end: 0.0).animate(_controller);
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.05, 0))
        .animate(_controller);
  }

  playAnimation() {
    _controller.reset();
    _controller.forward();
  }

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
            padding: const EdgeInsets.only(left: 65.0),
            child: FutureBuilder(
              future: playAnimation(),
              builder: (context, snapshot) {
                return FadeTransition(
                  opacity: _fadeanimation,
                  child: SlideTransition(
                    position: _animation,
                    child: ListView(
                        children: getList(selectedTabIndex),
                        scrollDirection: Axis.horizontal),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getList(index) {
    return [
      [
        ForumCard(forum: pubgForum),
        ForumCard(forum: fortniteForum),
        ForumCard(forum: fortniteForum),
        ForumCard(forum: fortniteForum)
      ],
      [
        ForumCard(forum: pubgForum),
        ForumCard(forum: fortniteForum),
      ],
      [
        ForumCard(forum: pubgForum),
        ForumCard(forum: fortniteForum),
        ForumCard(forum: fortniteForum)
      ],
    ][index];
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
