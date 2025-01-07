import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smarterminal/product/pages/productInfo/productModel.dart';

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

      productModel _product1 = productModel(
          name: "product1",
          purchasePrice: 1,
          salePrice: 1,
          group: "group1",
          amount: 1,
          monthlySale: 1);

      productModel _product2 = productModel(
          name: "product2",
          purchasePrice: 2,
          salePrice: 2,
          group: "group2",
          amount: 2,
          monthlySale: 2);



      setState(() {
         _products = [_product1, _product2];
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
                              builder: (context) =>
                                  ProductDetailPage(product: product),
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

class ProductDetailPage extends StatelessWidget {
  final productModel product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Text(
          'Welcome to the ${product.name} page!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
