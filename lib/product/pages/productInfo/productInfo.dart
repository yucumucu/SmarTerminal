import 'package:flutter/material.dart';
import 'package:smarterminal/product/pages/productInfo/productModel.dart';


class productInfo extends StatefulWidget {

  final productModel model;
  productInfo({super.key, required this.model});

  @override
  State<productInfo> createState() => _productInfoState();
}

class _productInfoState extends State<productInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(child: Text(widget.model.name))),
    );
  }
}
