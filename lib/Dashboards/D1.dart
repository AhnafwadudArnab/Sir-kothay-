// ignore_for_file: deprecated_member_use, use_build_context_synchronously, unnecessary_brace_in_string_interps

import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sirrkothay/Dashboards/D2.dart' as d2 show D2Page;

import '../Login_signup/login.dart';
import 'edit_form.dart' as edit_form show EditProfileForm;

class D1Page extends StatefulWidget {
  final String name;
  final String email;
  final String bio;
  final String organization;
  final String phone;
  final String designation;
  final String roomNumber;
  final String messages = '';
  const D1Page({
    super.key,
    required this.name,
    required this.email,
    required this.bio,
    required this.organization,
    required this.phone,
    required this.designation,
    required this.roomNumber,
  });
  @override
  // ignore: library_private_types_in_public_api
  _D1PageState createState() => _D1PageState();
}

class _D1PageState extends State<D1Page> {
  final GlobalKey _qrkey = GlobalKey();
  bool isActive = true;
  bool isqrActive = true;
  bool isProfileComplete = false;
  bool isQRCodeGenerated = false;
  String messege = '';
  String data = '';
  void _handleMessageSave(String message) {
    if (kDebugMode) {
      print('Message saved: $message');
    }
  }
  List<String> messages = [];
  int tapCount = 0;

  void _addMessage() {
    setState(() {
      tapCount++;
      messages.add("New Message $tapCount");
    });
  }

  bool dirExist = false;
  Future<void> _captureAndSavePng() async {
    try {
      RenderRepaintBoundary boundary =
          _qrkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save to the app's document directory instead of external storage
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = File('${directory.path}/QRCode_preview.png');
      await imagePath.writeAsBytes(pngBytes);
      if (kDebugMode) {
        print("Image saved to: ${imagePath.path}");
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("QR Code saved to app directory!")),
      );
    } catch (e) {
      if (kDebugMode) {
        print("Error saving QR code: $e");
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to save QR Code!")));
    }
  }

  Future<void> requestPermissions() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      if (kDebugMode) {
        print("Permission granted!");
      }
    } else {
      if (kDebugMode) {
        print("Permission denied!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Image.asset('assets/sirkothayLogo.png', height: 40),
        ),
        backgroundColor: const Color.fromARGB(255, 154, 172, 184),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder:
                      (context) => LoginPage(), // Replace with your login page
                ),
              );
            },
            child: Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Container(
                width: 360,
                height: 400,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(242, 245, 137, 13),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 96,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/user.gif'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: edit_form.EditProfileForm(),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: Text("Edit"),
                    ),
                    Text(
                      'Name: ${widget.name}',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Email: ${widget.email}',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Phone Number: ${widget.phone}',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Designation: ${widget.designation}',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Organizations: ${widget.organization}',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Bio: ${widget.bio}',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Room Number: ${widget.roomNumber}',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 360,
                height: 335,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(241, 109, 176, 214),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      'Get the QR Code from here!!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    if (!isProfileComplete)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isProfileComplete = true;
                            //     showModalBottomSheet(
                            //   context: context,
                            //   isScrollControlled: true,
                            //   builder: (BuildContext context) {
                            //     return Padding(
                            //       padding: EdgeInsets.only(
                            //         bottom:
                            //             MediaQuery.of(context).viewInsets.bottom,
                            //       ),
                            //       child: EditProfileForm(),
                            //     );
                            //   },
                            // );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
                          "Please complete your profile to generate QR code !",
                        ),
                      )
                    //SizedBox(height: 100),
                    else if (!isQRCodeGenerated)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isQRCodeGenerated = true;
                            isqrActive = true;
                            data =
                                '${widget.name}\n${widget.email}\n${widget.phone}\n${widget.designation}\n${widget.organization}\n${widget.bio}\n${widget.roomNumber}';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                        ),
                        child: Text(
                          "Generate",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    else
                      Column(
                        children: [
                          QrImageView(data: data, size: 200),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              _captureAndSavePng();
                            },
                            child: Text("Download"),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
                SizedBox(height: 15),
                Container(
                width: 360,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(241, 109, 176, 214),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  const SizedBox(height: 28),
                  for (int i = 0; i < messages.length; i++) _buildMessageCard(messages[i]),
                  ],
                ),
                ),
              ],
              ),
            ),
            ),
            floatingActionButton: AddMessageButton(
              name: widget.name,
              email: widget.email,
              bio: widget.bio,
              organization: widget.organization,
              phone: widget.phone,
              designation: widget.designation,
              roomNumber: widget.roomNumber,
              message: '',
            ),
          );
          }

          Widget _buildMessageCard(String message) {
          return Container(
            width: 290,
            height: 130,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
              ),
            ],
            ),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                message,
                style: const TextStyle(fontSize: 18),
                ),
              // FloatingActionButton(
              //   onPressed: _addMessage,
              //   child: const Icon(Icons.add),
              // ),
              const SizedBox(height: 10),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                onPressed: () {
                  setState(() {
                  isActive = !isActive;
                  });
                },
                child: Text(isActive ? "Deactivate" : "Activate"),
                ),
                ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: const Text("Edit"),
                ),
                ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Delete"),
                ),
              ],
              ),
            ],
            ),
          );
          }
        }

class AddMessageButton extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final String name;
  final String email;
  final String bio;
  final String organization;
  final String phone;
  final String designation;
  final String roomNumber;
  final String message;

  AddMessageButton({
    super.key,
    required this.name,
    required this.email,
    required this.bio,
    required this.organization,
    required this.phone,
    required this.designation,
    required this.roomNumber,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 171, 214, 221),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Add Message', style: TextStyle(fontSize: 18)),
                          SizedBox(height: 8),
                          TextField(controller: _messageController),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  String message = _messageController.text;
                                  Get.snackbar(
                                    'Message Added',
                                    message,
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  Navigator.pop(context);
                                  // Call another function with the message
                                  (context
                                          .findAncestorStateOfType<
                                            _D1PageState
                                          >())
                                      ?._handleMessageSave(message);
                                  // Navigate to another page with the message
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => d2.D2Page(
                                            name: name,
                                            email: email,
                                            bio: bio,
                                            organization: organization,
                                            phone: phone,
                                            designation: designation,
                                            roomNumber: roomNumber,
                                            message: message,
                                          ),
                                    ),
                                  );
                                },
                                child: Text("Save"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.add_comment),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 76, 135, 175),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => d2.D2Page(
                        name: name,
                        email: email,
                        bio: bio,
                        organization: organization,
                        phone: phone,
                        designation: designation,
                        roomNumber: roomNumber,
                        message: '',
                      ),
                ),
              );
            },
            child: Icon(Icons.view_week),
          ),
        ],
      ),
    );
  }
}
