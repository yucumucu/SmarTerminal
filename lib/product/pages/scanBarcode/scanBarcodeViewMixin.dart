import 'package:flutter/material.dart';
import 'package:smarterminal/product/pages/productInfo/productInfo.dart';

import '../productInfo/productModel.dart';



mixin scanBarcodeViewMixin {


  Future<productModel> getScannedProduct(BuildContext context) async {

    productModel model = productModel(
      name: "product name",
      purchasePrice: 0.0,
      salePrice: 0.0,
      amount: 0.0,
      group: "group",
      monthlySale: 0
    );

    const Duration(milliseconds: 500);


    return model;


    // Add your logic here
  }
}