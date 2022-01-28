import 'dart:io';

import 'package:flutter_practical/Constants/api.dart';
import 'package:flutter_practical/data/model/api_response.dart';
import 'package:flutter_practical/data/model/product.dart';
import 'package:flutter_practical/services/http.service.dart';
import 'package:flutter_practical/utils/api_response.utils.dart';

class ProductRepository extends HttpService{
  Future<List<Product>> getAllProduct() async {
    List<Product> products = [];

    //make http call for vendors data
    final apiResult = await get(Api.getProductApi);

    //format the resposne
    ApiResponse apiResponse = ApiResponseUtils.parseApiResponse(apiResult);
    if (!apiResponse.allGood) {
      throw apiResponse.errors;
    }

    //convert the data to list of vendor model
    (apiResponse.body["data"] as List).forEach((vendorJSONObject) {
      //product data
      final mProdcut = Product.fromJson(vendorJSONObject);
      products.add(mProdcut);

    });

    return products;

  }
}