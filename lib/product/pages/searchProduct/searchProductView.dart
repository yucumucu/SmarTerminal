import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarterminal/product/pages/productInfo/productInfo.dart';
import 'dart:convert';

import 'package:smarterminal/product/pages/productInfo/productModel.dart';
import 'package:smarterminal/utils/dummyDataGenerator/dummyService.dart';

import '../../../utils/enum/urlEnum.dart';

class searchProductView extends StatefulWidget {
  @override
  _searchProductViewState createState() => _searchProductViewState();
}

class _searchProductViewState extends State<searchProductView> {
  final TextEditingController _searchController = TextEditingController();
  List<productModel> _products = [];
  bool _isLoading = false;
  String? _error;

  Future<void> _fetchProducts(String query) async {

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {


      String searchProductURL = urlEnum.getSearchedProduct.url();
      String rootURL = urlEnum.getRoot.url();

      String finalURL = rootURL + searchProductURL;


      final Uri url = Uri.parse(finalURL).replace(
          queryParameters: {
            "name": query
          }
      );

      http.Response response_real = await http.get(url);


      List<dynamic> data;

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
      setState(()  {

        _products = data.map((e) => productModel.fromJson(e)).toList();

      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Product',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _fetchProducts(_searchController.text),
                ),
              ),
              onSubmitted: _fetchProducts,
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else if (_error != null)
              Center(
                child: Text(
                  _error!,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              )
            else if (_products.isEmpty)
              const Center(
                child: Text(
                  'No products found.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.group ?? ''),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => productInfo(model: product),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
