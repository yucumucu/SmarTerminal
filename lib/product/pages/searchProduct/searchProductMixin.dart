

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smarterminal/product/pages/productInfo/productModel.dart';
import 'package:smarterminal/utils/enum/urlEnum.dart';

Future<List<productModel>> searchProduct(String productName) async {

  http.Response response_real = http.Response("", 404);
  String searchProductURL = urlEnum.getSearchedProduct.url();

  try {
    final Uri url = Uri.parse(searchProductURL).replace(
      queryParameters: {
        "name": productName
      }
    );
    response_real = await http.get(url);

  }catch(e){
    print(e);
  }

  List<Map<String, dynamic>> data;

  if(response_real.statusCode != 200){
    data = [
      {
        "name": "product name",
        "purchasePrice": 0.0,
        "salePrice": 0.0,
        "group": "group",
        "monthlySale": 0
      }
    ];

  }else{
    data = jsonDecode(response_real.body);

  }

  List<productModel> products = data.map((e) => productModel.fromJson(e)).toList();

  return products;

}

/*
mixin searchProductViewMixin{

  Future<void> _fetchProducts(String query) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Replace with your server's URL
      final url = Uri.parse('https://yourserver.com/api/products');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'query': query}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _products = List<Map<String, dynamic>>.from(data['products']);
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      setState(() {
        _error = "An error occurred while fetching products. Please try again.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

 */