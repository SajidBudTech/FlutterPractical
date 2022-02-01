import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_practical/constants/app_routes.dart';
import 'package:flutter_practical/data/model/loading_state.dart';
import 'package:flutter_practical/data/model/product.dart';
import 'package:flutter_practical/data/repositories/product.repository.dart';
import 'package:flutter_practical/utils/flash_alert.dart';
import 'package:flutter_practical/viewmodels/base.viewmodel.dart';
import 'package:rxdart/subjects.dart';

class ProductPageViewModel extends MyBaseViewModel {

  LoadingState productLoadingState=LoadingState.Loading;
  ProductRepository _productRepository=ProductRepository();
  List<Product> products=[];
  List<Product> cartList=[];

  double totalPrice=0;

  BehaviorSubject<List<Product>> _cartValid = BehaviorSubject<List<Product>>.seeded(null);
  Stream<List<Product>> get validCartList => _cartValid.stream;

  ProductPageViewModel(BuildContext context) {
    this.viewContext = context;
  }

  //getting all popular Product
  void getPopularProduct() async {
    //add null data so listener can show shimmer widget to indicate loading
    productLoadingState = LoadingState.Loading;
    notifyListeners();
    try {

       products = await _productRepository.getAllProduct();
       productLoadingState = LoadingState.Done;
       notifyListeners();
    } catch (error) {
      productLoadingState = LoadingState.Failed;
      notifyListeners();
    }
  }


  addtoCart(Product product){
    bool check=false;
    totalPrice=0;
    cartList.forEach((element) {
      totalPrice=totalPrice+double.parse(element.price.split("\$")[1]);
        if(product.id==element.id){
          check=true;
        }
    });
    if(!check){
      _cartValid.add(cartList);
      cartList.add(product);
      ShowFlash(viewContext,
          title: "Success",
          message: "product added to your cart successfully.",
          flashType: FlashType.success)
          .show();
    }else{
      ShowFlash(viewContext,
          title: "Failed",
          message: "product already addec to your cart list.",
          flashType: FlashType.failed)
          .show();
    }

    notifyListeners();
  }


  openSearchPage() {

  }



  void switchPageToCart() {
    Navigator.pushNamed(
      viewContext,
      AppRoutes.cartRoute,
      arguments: this
    );
  }

  void removeCart(Product product) {
    totalPrice=0;
    int index;

    for(int i=0;i<cartList.length;i++){
      totalPrice=totalPrice+double.parse(cartList[i].price.split("\$")[1]);
      if(product.id==cartList[i].id){
        index=i;
      }
    }
     totalPrice=totalPrice-double.parse(cartList[index].price.split("\$")[1]);
     cartList.removeAt(index);

    ShowFlash(viewContext,
        title: "Success",
        message: "product removed from your cart successfully.",
        flashType: FlashType.success)
        .show();

      setRefreshPage(true);
     //notifyListeners();
  }
}
