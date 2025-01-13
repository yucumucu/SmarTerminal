import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../utils/enum/urlEnum.dart';
import '../productInfo/productModel.dart';



mixin scanBarcodeViewMixin {


  Future<productModel> getScannedProduct(BuildContext context, String scannedBarcode) async {


    /*
    productModel model = productModel(
      name: "product name",
      purchasePrice: 0.0,
      salePrice: 0.0,
      amount: 0.0,
      group: "group",
      monthlySale: 0
    );

    const Duration(milliseconds: 500);

     */

    http.Response response_real = http.Response("", 404);

    String scannedBarcodeURL = urlEnum.getScannedBarcode.url();
    String rootURL = urlEnum.getRoot.url();

    String finalURL = rootURL + scannedBarcodeURL;

    try{

      final Uri url = Uri.parse(finalURL).replace(
          queryParameters: {
            "barkodNo": scannedBarcode
          }
      );
      response_real = await http.get(url);

    }catch(e){
      print(e);
    }

    Map<String, dynamic > data;


    if (response_real.statusCode != 200){

      data = {
        "name": "product name",
        "purchasePrice": 0.0,
        "salePrice": 0.0,
        "group": "group",
        "amount": 0.0,
        "monthlySale": 0
      };
    }
    else
    {
      data = jsonDecode(response_real.body);
    }

    productModel model = productModel.fromJson(data);


    return model;
  }


    // Add your logic here

}