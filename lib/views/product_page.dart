import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/Constants/app_color.dart';
import 'package:flutter_practical/Constants/app_paddings.dart';
import 'package:flutter_practical/Constants/app_strings.dart';
import 'package:flutter_practical/Constants/app_text_styles.dart';
import 'package:flutter_practical/data/model/loading_state.dart';
import 'package:flutter_practical/data/model/state_data_model.dart';
import 'package:flutter_practical/utils/ui_spacer.dart';
import 'package:flutter_practical/viewmodels/product_page.viewmodel.dart';
import 'package:flutter_practical/widgets/buttons/floating_cart_button.dart';
import 'package:flutter_practical/widgets/listitems/product_list_view_item.dart';
import 'package:flutter_practical/widgets/search/search_bar.dart';
import 'package:flutter_practical/widgets/shimmers/vendor_shimmer_list_view_item.dart';
import 'package:flutter_practical/widgets/state/state_loading_data.dart';
import 'package:stacked/stacked.dart';

class ProductPage extends StatefulWidget {
  ProductPage({
    Key key,
  }) : super(key: key);


  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //CartBloc _cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_cartBloc.getUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //_cartBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductPageViewModel>.reactive(
      viewModelBuilder: () => ProductPageViewModel(context),
      onModelReady: (model) => model.getPopularProduct(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColor.appBackground(context),
          body: Column(
            //padding: AppPaddings.defaultPadding(),
            children: [
              UiSpacer.verticalSpace(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 0),
                child: Text(
                  "Catalog App",
                  style: AppTextStyle.h2TitleTextStyle(
                    color: AppColor.textColor(context),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: AppPaddings.contentPaddingSize,
                ),
                child: Text(
                  "Trending Products",
                  style: AppTextStyle.h4TitleTextStyle(
                    color: AppColor.textColor(context),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 8,left: 20,right: 20,bottom: 0),
                  child:SearchBar(
                onSearchBarPressed: model.openSearchPage,
                readOnly: true,
                hintText: "Search Product",
              )),
              UiSpacer.verticalSpace(),
              model.productLoadingState == LoadingState.Loading
              //the loadinng shimmer
                  ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPaddings.contentPaddingSize,
                ),
                child: VendorShimmerListViewItem(),
              )
              // the faild view
                  : model.productLoadingState == LoadingState.Failed
                  ? LoadingStateDataView(
                stateDataModel: StateDataModel(
                  showActionButton: true,
                  actionButtonStyle: AppTextStyle.h4TitleTextStyle(
                    color: Colors.red,
                  ),
                  actionFunction: model.getPopularProduct,
                ),
              )
              // the categories list
                  :
           Expanded(child: Stack(
            children: <Widget>[
               ListView.separated(
                shrinkWrap: true,
                primary: true,
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: model.products.length,
                padding: AppPaddings.defaultPadding(),
                separatorBuilder: (context, index) =>
                    UiSpacer.verticalSpace(space: 10),
                itemBuilder: (context, index) {
                  return ProductListViewItem(
                    product:  model.products[index],
                    model: model,
                  );
                },
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1,
                right: AppPaddings.contentPaddingSize,
                child: FloatingCartButton(
                  model: model,
                ),
              )
            ]))
            ],
          )
        );
      },
    );
  }
}
