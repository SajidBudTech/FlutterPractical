import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/Constants/app_text_styles.dart';
import 'package:flutter_practical/constants/app_color.dart';

enum FlashType{
  failed,
  success
}
class ShowFlash{
  BuildContext context;
  String title;
  String message;
  FlashType flashType;


  ShowFlash(this.context,{String title,String message,FlashType flashType}){
    this.title=title;
    this.message=message;
    this.flashType=flashType;
  }

  show(){
    showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          backgroundColor: flashType==FlashType.success?AppColor.primaryColor:AppColor.failedColor,
          brightness: Brightness.light,
         // boxShadows: [BoxShadow(blurRadius: 4)],
         // barrierBlur: 3.0,
         // barrierColor: Colors.black38,
          //barrierDismissible: true,
          behavior: FlashBehavior.fixed,
          forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
          //behavior: FlashBehavior.floating,
          position: FlashPosition.top,
          child: FlashBar(
            title: title==null?Container()
            :Text(title??"",style: AppTextStyle.h3TitleTextStyle(
                color:Colors.white,
                fontWeight: FontWeight.w500
            ),),
            content:message==null?Container():
            Text(message,
               style: AppTextStyle.h5TitleTextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400
              ),),
          ),
        );
      },
    );
  }
}