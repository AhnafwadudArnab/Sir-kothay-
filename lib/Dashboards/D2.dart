import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessageBoxScreen(),
    );
  }
}

class MessageBoxScreen extends StatelessWidget {
  const MessageBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile & Messages"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileSection(),
            SizedBox(height: 16.0),
            QRSection(),
            SizedBox(height: 16.0),
            MessageBox(),
            Spacer(),
            AddMessageButton(),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundColor: Colors.grey),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ahanaf 222", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("aarnab222126@gmail.com", style: TextStyle(color: Colors.grey[700])),
                  Text("4564656219"),
                  Text("Organization: ssss", style: TextStyle(color: Colors.grey[700]))
                ],
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Edit"))
          ],
        ),
      ),
    );
  }
}

class QRSection extends StatelessWidget {
  const QRSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // QrImage(
            //   data: "Ahanaf 222",
            //   version: QrVersions.auto,
            //   size: 100.0,
            // ),
            SizedBox(height: 8),
            ElevatedButton(onPressed: () {}, child: Text("Download"))
          ],
        ),
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
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.amber), child: Text("Edit")),
                SizedBox(width: 8),
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: Text("Delete")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AddMessageButton extends StatelessWidget {
  const AddMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {},
        child: Icon(Icons.add_comment),
      ),
    );
  }
}
