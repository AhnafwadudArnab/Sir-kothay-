// ignore_for_file: no_logic_in_create_state

import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AppColor {
  static const Color primary = Color(0xFF0D47A1);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
}

class MainQRcodepage extends StatefulWidget {
  const MainQRcodepage({super.key});

  @override
  State<StatefulWidget> createState() => _MainQRcodepageState();
}

class _MainQRcodepageState extends State<MainQRcodepage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _organizationsController = TextEditingController();
  final GlobalKey _qrkey = GlobalKey();
  bool dirExist = false;
  dynamic externalDir = 'Downloads/storage/emulated/0/QRCode.png';
  String data = 'Hello';

  Future<void> _captureAndSavePng() async {
    try {
      RenderRepaintBoundary boundary =
          _qrkey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      var image = await boundary.toImage(pixelRatio: 3.0);

      final whitepaint = Paint()..color = Colors.white;
      final recorder = PictureRecorder();
      final canvas = Canvas(
        recorder,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      );
      canvas.drawRect(
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        whitepaint,
      );
      canvas.drawImage(image, Offset.zero, Paint());
      final picture = recorder.endRecording();
      final img = await picture.toImage(image.width, image.height);

      ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      //for duplicate file name ?//
      String filename = 'qr_code';
      int i = 1;
      while (await File('$externalDir/$filename.png').exists()) {
        filename = 'qr_code($i)';
        i++;
      }
      //path already exist or not//
      dirExist = await Directory('$externalDir').exists();

      if (!dirExist) {
        await Directory('$externalDir').create(recursive: true);
      }

      final file = await File(
        '$externalDir/$filename.png',
      ).create(recursive: true);
      await file.writeAsBytes(pngBytes);

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('QR Code saved to Gallery')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save QR Code!!')));
      }
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/sirkothayLogo.png', height: 40),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter your name',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter your email',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _bioController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Bio',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter your bio',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _designationController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Designation',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter your designation',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Phone',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter your phone number',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _organizationsController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Organizations',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter your organizations',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  setState(() {
                    data = _nameController.text;
                  });
                },
                fillColor: AppColor.primary,
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                child: Text(
                  'Generate QR Code',
                  style: TextStyle(color: AppColor.white),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: RepaintBoundary(
                  key: _qrkey,
                  child: QrImageView(
                    data: data,
                    version: QrVersions.auto,
                    size: 190.0,
                    gapless: true,
                    errorStateBuilder: (ctx, err) {
                      return Center(
                        child: Text(
                          "Uh oh! Something went wrong...",
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RawMaterialButton(
                onPressed: _captureAndSavePng,
                fillColor: AppColor.primary,
                shape: const StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                child: Text(
                  'Save QR Code',
                  style: TextStyle(color: AppColor.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              // New widget added here
              Text(
                'This is a new widget added at the bottom',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
