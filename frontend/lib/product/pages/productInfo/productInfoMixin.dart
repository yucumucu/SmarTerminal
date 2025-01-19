import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../utils/enum/urlEnum.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../utils/enum/urlEnum.dart';

mixin productInfoMixin {
  Future<bool> editSalePrice(BuildContext context, int id, double salePrice) async {
    try {
      String editSalePriceURL = urlEnum.getEditSalePrice.url();
      String rootURL = urlEnum.getRoot.url();

      String finalURL = rootURL + editSalePriceURL;

      final Uri url = Uri.parse(finalURL).replace(
        queryParameters: {
          "id": id.toString(),
          "price": salePrice.toStringAsFixed(2).toString(),
        },
      );

      print("Requesting URL: $url");

      http.Response response_real = await http.put(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      if (response_real.statusCode != 200) {
        print("Error: ${response_real.statusCode}");
        print("Body: ${response_real.body}");
        return false;
      }

      return true;
    } catch (e) {
      print("Exception: $e");
      return false;
    }
  }
}
