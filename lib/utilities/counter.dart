import 'package:covid_19/utilities/constant.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const Counter({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Container(
        //   padding: EdgeInsets.all(6),
        //   height: 25,
        //   width: 25,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: color.withOpacity(.26),
        //   ),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: Colors.transparent,
        //       border: Border.all(
        //         color: color,
        //         width: 2,
        //       ),
        //     ),
        //   ),
        // ),
        (title == 'Confirmed')?Text("🤒", style: kIconTextStyle,):(title == 'Deaths')?Text("💀",style: kIconTextStyle,):Text("🤗",style: kIconTextStyle,),
        SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 25,
            color: color,
          ),
        ),
        Text(title, style: kSubTextStyle),
      ],
    );
  }
}


