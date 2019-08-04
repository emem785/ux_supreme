import 'package:flutter/material.dart';
import 'package:ux/common/AppBackcground.dart';
import 'package:ux/model/topic.dart';
import 'package:ux/styleguide/colors.dart';
import 'package:ux/styleguide/text_styles.dart';
import '../model/forum.dart';
import '../common/label_values.dart';

class DetailsPage extends StatefulWidget {
  final Forum forum;

  DetailsPage({this.forum});

  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Animation<double> _scaleAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _offsetAnimation = Tween<Offset>(begin: Offset(0,0), end:Offset(0,1) ).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  // _playAnimation(){
  //   _controller.reset();
  //   _controller.forward();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstOrangeCircleColor,
            secondColor: secondOrangeCircleColor,
            thirdColor: thirdOrangeCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 100.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    LabelValueWidget(
                      value: widget.forum.topics.length.toString(),
                      label: "topics",
                      labelStyle: whiteLabelTextStyle,
                      valueStyle: whiteValueTextStyle,
                    ),
                    LabelValueWidget(
                      value: widget.forum.threads,
                      label: "threads",
                      labelStyle: whiteLabelTextStyle,
                      valueStyle: whiteValueTextStyle,
                    ),
                    LabelValueWidget(
                      value: widget.forum.subs,
                      label: "subs",
                      labelStyle: whiteLabelTextStyle,
                      valueStyle: whiteValueTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Hero(
                tag: widget.forum.title,
                child: ClipRRect(
                  child: Image.asset(widget.forum.imagePath),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40.0)),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0)),
              child: Container(
                color: Colors.white,
                height: 280,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0,32.0,16.0,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Topics',style: subHeadingStyle.copyWith(fontSize: 26),
                      ),
                      Expanded(
                        child: SlideTransition(
                          position: _offsetAnimation,
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              TopicItem(topic: widget.forum.topics[0]),
                              TopicItem(topic: widget.forum.topics[1]),
                              TopicItem(topic: widget.forum.topics[0])
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 255,
            right: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              
                child: Material(
                  color: Colors.white,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.forum.rank,
                      style: rankStyle,
                    ),
                  ),
                  elevation: 10.0,
                ),
             
            ),
          ),
        ],
      ),
    );
  }
}

class TopicItem extends StatelessWidget {
  final Topic topic;

  TopicItem({this.topic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                topic.question,
                style: topicQuestionTextStyle,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: primaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    topic.answerCount,
                    style: topicAnswerCountTextStyle,
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          topic.recentAnswer,
          style: topicAnswerTextStyle,
        )
      ],
    );
  }
}
