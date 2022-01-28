import 'package:flutter/material.dart';
import 'package:flutter_practical/constants/app_color.dart';
import 'package:flutter_practical/constants/app_text_direction.dart';
import 'package:flutter_practical/constants/app_text_styles.dart';

class LeadingAppBar extends StatelessWidget {
  const LeadingAppBar({
    Key key,
    this.color,
    this.title
  }) : super(key: key);

  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
        onTap: () {
      Navigator.pop(context);
    },
    child: Icon(
    Icons.arrow_back_ios,
    color: this.color ?? AppColor.primaryColor,
    ),
    ),
     Expanded(child: Container(
       alignment: Alignment.center,
       child:Text(
         title,
         style: AppTextStyle.h3TitleTextStyle(
           color: AppColor.textColor(context),
           fontWeight:FontWeight.w400,
         ),
         textDirection: AppTextDirection.defaultDirection,
       ),
     ))
      ],
    );
  }
}
