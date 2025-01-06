import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:smarterminal/product/pages/productInfo/productInfo.dart';
import 'package:smarterminal/product/pages/scanBarcode/scanBarcodeViewMixin.dart';

import '../productInfo/productModel.dart';

class scanBarcodeView extends StatefulWidget with scanBarcodeViewMixin {
  @override
  _scanBarcodeViewState createState() => _scanBarcodeViewState();
}

class _scanBarcodeViewState extends State<scanBarcodeView> {
  String _scannedBarcode = 'No barcode scanned';

  /// Start scanning for a barcode
  Future<void> startBarcodeScan() async {
    String scannedBarcode;
    try {
      scannedBarcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Color of the cancel button
        'Cancel',  // Cancel button text
        true,      // Show flash option
        ScanMode.BARCODE, // Scan mode (BARCODE or QR_CODE)
      );
    } catch (e) {
      scannedBarcode = 'Failed to scan barcode.';
    }

    if (!mounted) return;

    setState(() {
      if (scannedBarcode != '-1') {

        Navigator.push(context, MaterialPageRoute(builder: (context) => const scanBarcodeLoading()));


      } else {
        _scannedBarcode = 'Scan cancelled.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Scanned Barcode:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              _scannedBarcode,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: startBarcodeScan,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: const Text('Start Scanning'),
            ),
          ],
        ),
      ),
    );
  }
}

class scanBarcodeLoading extends StatelessWidget with scanBarcodeViewMixin {
  const scanBarcodeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: scanBarcodeView().getScannedProduct(context),
          builder: (context, snapshot){

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.green),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {

              productModel model = snapshot.data as productModel;

              Navigator.push(context, MaterialPageRoute(builder: (context) => productInfo(model: model)));


            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "Failed to load scanned data. Please try again.",
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            return const Center(
              child: Text(
                "Failed to load scanned data. Please try again.",
                style: TextStyle(color: Colors.red),
              ),
            );




      })
    );
  }
}

