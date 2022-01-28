import 'package:flutter/material.dart';
import 'package:flutter_practical/constants/app_routes.dart';
import 'package:flutter_practical/views/cart_page.dart';
import 'package:flutter_practical/views/product_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.productRoute:
      return MaterialPageRoute(builder: (context) => ProductPage());
    case AppRoutes.cartRoute:
      return MaterialPageRoute(builder: (context) => CartPage(
        model: settings.arguments,
      ));

    default:
      return MaterialPageRoute(builder: (context) => ProductPage());
  }
}
