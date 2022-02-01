import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_practical/Constants/app_color.dart';
import 'package:flutter_practical/constants/app_paddings.dart';
import 'package:flutter_practical/constants/app_routes.dart';
import 'package:flutter_practical/constants/app_sizes.dart';
import 'package:flutter_practical/constants/app_text_direction.dart';
import 'package:flutter_practical/constants/app_text_styles.dart';
import 'package:flutter_practical/data/model/product.dart';
import 'package:flutter_practical/utils/ui_spacer.dart';
import 'package:flutter_practical/viewmodels/product_page.viewmodel.dart';
import 'package:flutter_practical/widgets/cornered_container.dart';

class ProductListViewItem extends StatelessWidget {

  ProductListViewItem({
    Key key,
    @required this.product,
    this.model
  }) : super(key: key);

  Product product;
  ProductPageViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.buttonPadding(),
      color: AppColor.listItemBackground(context),
      child: Row(
        textDirection: AppTextDirection.defaultDirection,
        children: <Widget>[
          //product image
          //if no food image was supplied, a shrink SizedBox will be added
          if (product.image.isNotEmpty)
             CorneredContainer(
                child: CachedNetworkImage(
                  imageUrl: product.image??"",
                  placeholder: (context, url) => Container(
                    height: AppSizes.productImageHeight,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: AppSizes.productImageHeight,
                  width: AppSizes.productImageWidth,
                  fit: BoxFit.cover,
                ),
             )
          else
            SizedBox.shrink(),
          UiSpacer.horizontalSpace(),
          //food info
          Expanded(
            child: Column(
              textDirection: AppTextDirection.defaultDirection,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: AppTextStyle.h4TitleTextStyle(
                    color: AppColor.textColor(context),
                  ),
                  textDirection: AppTextDirection.defaultDirection,
                ),
                Text(
                  product.description,
                  style: AppTextStyle.h6TitleTextStyle(
                    color: AppColor.textColor(context),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textDirection: AppTextDirection.defaultDirection,
                ),
                UiSpacer.verticalSpace(space: 8),
                Row(
                  children: [
                    Text(
                      "${product.price}",
                      style: AppTextStyle.h3TitleTextStyle(
                        color: AppColor.textColor(context),
                        fontWeight:FontWeight.w600,
                      ),
                      textDirection: AppTextDirection.defaultDirection,
                    ),
                    UiSpacer.horizontalSpace(space: 10),
                    Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                        child:InkWell(
                      onTap: (){
                         model.addtoCart(product);
                       },
                      child: Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColor.accentColor,
                        ),
                        child: Icon(
                          FlutterIcons.cart_mco,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    )))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
