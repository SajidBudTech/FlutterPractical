import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/Constants/app_text_styles.dart';
import 'package:flutter_practical/utils/router.dart' as router;
import 'package:flutter_practical/views/product_page.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Constants/app_strings.dart';
import 'constants/app_color.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();



  // Run app!
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      onGenerateRoute: router.generateRoute,
      home: MyApp(),
      theme: ThemeData(
        accentColor: AppColor.accentColor,
        primaryColor: AppColor.primaryColor,
        primaryColorDark: AppColor.primaryColorDark,
        cursorColor: AppColor.cursorColor,
      ),
    ),
  );
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 6,
        navigateAfterSeconds: ProductPage(),
        title:Text('Welcome To Catalog App',
          style: AppTextStyle.h2TitleTextStyle(
         color: AppColor.textColor(context),
          fontWeight:FontWeight.w700
         )),
        //image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        onClick: ()=>print("Flutter India"),
        loaderColor: Colors.black
    );
  }
}
