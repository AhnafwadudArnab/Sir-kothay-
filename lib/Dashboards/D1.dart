import 'package:flutter/material.dart';

class D1Page extends StatelessWidget {
  final String name;
  final String email;
  const D1Page({super.key, required this.name, required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/sirkothayLogo.png', height: 40),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to D1 Page!'),
              Container(
                width: 350,
                height: 320,
                color: Colors.blue,
                child: Center(
                  child: Text('Profile box')
                  
                  ),
              ),
              SizedBox(height: 20),
              Container(
                width: 350,
                height: 250,
                color: const Color.fromARGB(255, 212, 124, 24),
                child: Center(child: Text('Qr Code')),
              ),

              SizedBox(height: 20),
              Container(
                width: 350,
                height: 320,
                color: Colors.green,
                child: Center(child: Text('Message from D1 Page')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}