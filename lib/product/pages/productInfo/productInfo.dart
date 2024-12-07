import 'package:flutter/material.dart';


class productInfo extends StatefulWidget {
  const productInfo({super.key});

  @override
  State<productInfo> createState() => _productInfoState();
}

class _productInfoState extends State<productInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("product info"),
    );
  }
}
