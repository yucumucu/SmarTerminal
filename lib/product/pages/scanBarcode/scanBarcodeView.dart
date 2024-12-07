import 'package:flutter/material.dart';


class scanBarcodeView extends StatefulWidget {
  const scanBarcodeView({super.key});

  @override
  State<scanBarcodeView> createState() => _scanBarcodeViewState();
}

class _scanBarcodeViewState extends State<scanBarcodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Scan Barcode'),
      ),
    );
  }
}
