import 'package:flutter/material.dart';


class searchProductView extends StatefulWidget {
  const searchProductView({super.key});

  @override
  State<searchProductView> createState() => _searchProductViewState();
}

class _searchProductViewState extends State<searchProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Search Product'),
      ),
    );
  }
}
