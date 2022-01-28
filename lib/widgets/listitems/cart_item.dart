import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_practical/constants/app_color.dart';
import 'package:flutter_practical/constants/app_text_direction.dart';
import 'package:flutter_practical/constants/app_text_styles.dart';
import 'package:flutter_practical/data/model/product.dart';
import 'package:flutter_practical/viewmodels/product_page.viewmodel.dart';

class CartItem extends StatefulWidget {
  CartItem({
    Key key,
    @required this.product,
    @required this.onRemovePressed,
    this.model
  }) : super(key: key);

  final Product product;
  final Function onRemovePressed;
  ProductPageViewModel model;
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
      stream: widget.model.validCartList,
      builder: (context, snapshot) {
        //cart item view
        return
            Row(
              textDirection: AppTextDirection.defaultDirection,
              children: <Widget>[
                Expanded(
                 child: Container(
                   alignment: Alignment.centerLeft,
                     child:Icon(
                   FlutterIcons.check_ant,
                   color: Colors.grey[400],
                   size: 20,
                 )),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                      child:Text(
                        widget.product.name,
                        style: AppTextStyle.h4TitleTextStyle(
                          color: AppColor.textColor(context),
                        ),
                        textDirection: AppTextDirection.defaultDirection,
                      )),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                      child:InkWell(
                      onTap:widget.onRemovePressed,
                      child:Icon(
                        FlutterIcons.remove_circle_outline_mdi,
                        color: Colors.grey[400],
                        size: 20,
                      ))),
                )
              ],
        );
      },
    );
  }

}
