import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';



abstract class CameraViewInit {
  CameraController get controller;
  Timer? get timer;
  bool get isCapturing;
  bool isNavigating = false;

  set timer(Timer? timer);
  set isCapturing(bool isCapturing);

}


class scanBarcodeView extends StatefulWidget {
  const scanBarcodeView({super.key});

  @override
  State<scanBarcodeView> createState() => _scanBarcodeViewState();
}

class _scanBarcodeViewState extends State<scanBarcodeView> {


  CameraController? _controller;

  @override
  Timer? timer;
  @override
  bool isCapturing = false;
  @override
  bool isNavigating = false;
  @override
  late Uint8List ss_image;


  @override
  void initState() {
    initializeCamera(context);
    super.initState();
  }


  Future<void> initializeCamera(BuildContext context) async {
    final cameras = await availableCameras();
    final firstCamera = cameras[0];

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    _controller?.setFlashMode(FlashMode.off);

    await _controller!.initialize();
    setState(() {});

    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      if (isCapturing) return;
      isCapturing = true;

      try {
        final image = await _controller!.takePicture();

        //final List<Uint8List> cropped_compressed_list = await cropAndCompressImage(context, image.path);

        //make sure image is deleted after use
        File(image.path).delete();

      } catch (e) {
        debugPrint('Error capturing image: $e');
      } finally {
        isCapturing = false;
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!(_controller?.value.isInitialized ?? false)) {
      return const SizedBox();
    }

    return Scaffold(
      body: CameraPreview(_controller!),
    );
  }
}
