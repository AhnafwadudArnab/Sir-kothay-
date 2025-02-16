import 'package:flutter/material.dart';
import 'package:sirkothayy/Dashboards/D1.dart';
import 'package:sirkothayy/Dashboards/edit_form.dart';
import 'package:sirkothayy/Login_signup/signup.dart';
// import 'package:sirkothayy/QRcode/qr_code.dart';

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
      // home: D1Page(
      //   name: 'Ahnaf',
      //   designation: 'UIU Ambassador',
      //   roomNumber: '123',
      //   email: 'ahnaf@example.com',
      //   bio: 'Embasador at UIU',
      //   organization: 'UIU',
      //   phone: '987-654-3210',
      // ),
     // home: EditProfileScreen(),
      home: const SignUpPage(),
      //home: EditProfileForm(name: 'Ahnaf',email: '',),
    );
  }
}
