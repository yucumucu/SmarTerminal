import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:smarterminal/product/pages/productInfo/productInfo.dart';
import 'package:smarterminal/product/pages/scanBarcode/scanBarcodeViewMixin.dart';

import '../productInfo/productModel.dart';

class scanBarcodeView extends StatefulWidget with scanBarcodeViewMixin {
  @override
  _scanBarcodeViewState createState() => _scanBarcodeViewState();
}

class _scanBarcodeViewState extends State<scanBarcodeView> {
  String _scannedBarcode = 'No barcode scanned';

  Future<void> startBarcodeScan() async {
    String scannedBarcode;
    try {
      scannedBarcode = await SimpleBarcodeScanner.scanBarcode(
        context,
        barcodeAppBar: const BarcodeAppBar(
          appBarTitle: 'Test',
          centerTitle: false,
          enableBackButton: true,
          backButtonIcon: Icon(Icons.arrow_back_ios),
        ),
        isShowFlashIcon: true,
        delayMillis: 2000,
        cameraFace: CameraFace.front,
      ) ?? "-1";

      if (scannedBarcode != '-1') {
        // Navigate after getting the scanned barcode.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => scanBarcodeLoading(scannedBarcode: scannedBarcode),
          ),
        );
      } else {
        setState(() {
          _scannedBarcode = 'Scan cancelled.';
        });
      }
    } catch (e) {
      setState(() {
        _scannedBarcode = 'Failed to scan barcode.';
      });
    }
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
  final String scannedBarcode;
  scanBarcodeLoading({super.key, required this.scannedBarcode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<productModel>(
        future: scanBarcodeView().getScannedProduct(context, scannedBarcode),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              productModel model = snapshot.data!;
              return productInfo(model: model);
            } else {
              return const Center(
                child: Text(
                  "Failed to load scanned data. Please try again.",
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
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
        },
      ),
    );
  }
}
