import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_practical/constants/app_color.dart';
import 'package:flutter_practical/constants/app_paddings.dart';
import 'package:flutter_practical/constants/app_text_direction.dart';
import 'package:flutter_practical/constants/app_text_styles.dart';
import 'package:flutter_practical/utils/ui_spacer.dart';
import 'package:flutter_practical/viewmodels/product_page.viewmodel.dart';
import 'package:flutter_practical/widgets/appbar/leading_app_bar.dart';
import 'package:flutter_practical/widgets/buttons/custom_button.dart';
import 'package:flutter_practical/widgets/listitems/cart_item.dart';
import 'package:stacked/stacked.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key,this.model}) : super(key: key);

  ProductPageViewModel model;
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin<CartPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
            backgroundColor: AppColor.appBackground(context),
            body:Container(
            padding: EdgeInsets.only(top: 60,left: 20,right: 20,bottom: 20),
            child:Column(
              children: [
                LeadingAppBar(
                    title: "Cart"
                ),
                Expanded(child:
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.model.cartList.length,
                    itemBuilder: (context, index) {
                      return CartItem(
                        product: widget.model.products[index],
                        model: widget.model,
                        onRemovePressed: () {
                           widget.model.removeCart(widget.model.cartList[index]);
                           Future.delayed(Duration(seconds: 3), (){
                             setState(() {

                             });
                           });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                  )),

                Row(
                  children: [
                    Container(
                        child:Text(
                          "\$"+ "${widget.model.totalPrice}",
                          style: AppTextStyle.h1TitleTextStyle(
                            color: AppColor.textColor(context),
                          ),
                          textDirection: AppTextDirection.defaultDirection,
                        )
                    ),
                    Expanded(child: Container(
                        alignment: Alignment.centerRight,
                        child:CustomButton(
                      color: AppColor.accentColor,
                      child: Text(
                        "Buy",
                        style: AppTextStyle.h4TitleTextStyle(
                          color: Colors.white,
                        ),
                        textDirection: AppTextDirection.defaultDirection,
                      ),
                      onPressed: (){},
                    )))
                  ],
                ),
              ],
            )
      ));
  }
}
