import 'package:flutter/material.dart';
import 'package:sirkothay/QRcode/qr_code.dart';
import 'Dashboards/D1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sir kothay?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home:  D1Page(name: 'Your Name', email: 'your.email@example.com'),
      home: MainQRcodepage(),
    );
  }
}
