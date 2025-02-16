// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:sirkothayy/Dashboards/edit_form.dart';
class D1Page extends StatefulWidget {
  final String name;
  final String email;
  final String bio;
  final String organization;
  final String phone;
  final String designation;
  final String roomNumber;
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
  _D1PageState createState() => _D1PageState();
}
class _D1PageState extends State<D1Page> {
  bool isActive = true;
  bool isqrActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Image.asset('assets/sirkothayLogo.png', height: 40),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 135, 175),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 360,
                height: 380,
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
                              child: EditProfileForm(),
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
              SizedBox(height: 20),
              Container(
                width: 360,
                height: 225,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(241, 109, 176, 214),
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
                    SizedBox(height: 15),
                    Text(
                      'Get the QR Code from here!!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 150,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/qr.gif'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // Add logic to toggle the status
                              isqrActive = !isqrActive;
                            });
                          },
                          child: Text(isqrActive ? "Genarate" : "Download"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 360,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(241, 109, 176, 214),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "Status: Active",
                        style: TextStyle(fontSize: 18),
                      ), //text paste here-Status: Active//
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // Add logic to toggle the status
                              isActive = !isActive;
                            });
                          },
                          child: Text(isActive ? "Deactivate" : "Activate"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                          ),
                          child: Text("Edit"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text("Delete"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddMessageButton(),
    );
  }
}

class AddMessageButton extends StatelessWidget {
  const AddMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 171, 214, 221),
            onPressed: () {},
            child: Icon(Icons.add_comment),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 76, 135, 175),
            onPressed: () {},
            child: Icon(Icons.view_week),
          ),
        ],
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("45445", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Deactivate")),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  child: Text("Edit"),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}