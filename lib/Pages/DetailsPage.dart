import 'package:flutter/material.dart';
import 'package:ux/common/AppBackcground.dart';
import 'package:ux/styleguide/colors.dart';
import 'package:ux/styleguide/text_styles.dart';
import '../model/forum.dart';
import '../common/label_values.dart';

class DetailsPage extends StatelessWidget {
  final Forum forum;

  DetailsPage({this.forum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(firstColor: firstOrangeCircleColor,secondColor: secondOrangeCircleColor,thirdColor: thirdOrangeCircleColor,),
          Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Icon(Icons.arrow_back),
              ),
               Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LabelValueWidget(
                  value: forum.topics.length.toString(),
                  label: "topics",
                  labelStyle: whiteLabelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.threads,
                  label: "threads",
                  labelStyle: whiteLabelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelValueWidget(
                  value: forum.subs,
                  label: "subs",
                  labelStyle: whiteLabelTextStyle,
                  valueStyle: valueTextStyle,
                ),
              ],
            )
            ],
          )
        ],
      ),
    );
  }
}
