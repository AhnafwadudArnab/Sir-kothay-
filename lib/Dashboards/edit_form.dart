// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sirkothayy/Dashboards/D1.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: EditProfileForm(),
                );
              },
            );
          },
          child: Text("Edit Profile"),
        ),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _roomno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            GestureDetector(
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
              // Handle the selected image
              if (kDebugMode) {
                print('Image selected: ${image.path}');
              }
              }
            },
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(
              Icons.camera_alt,
              size: 50,
              color: Colors.white,
              ),
            ),
            ),
            SizedBox(height: 20),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10),
          TextField(
            controller: _bioController,
            decoration: InputDecoration(
              labelText: "Bio",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _designationController,
            decoration: InputDecoration(
              labelText: "Designation",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _organizationController,
            decoration: InputDecoration(
              labelText: "Organization",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _roomno,
            decoration: InputDecoration(
              labelText: "Room No:",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 10),
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: "Phone",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => D1Page(
                        name: _usernameController.text,
                        email: _emailController.text,
                        bio: _bioController.text,
                        organization: _organizationController.text,
                        phone: _phoneController.text,
                        designation: _designationController.text,
                        roomNumber: _roomno.text, // Add the designation argument
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
    );
  }
}

class ProfileDetailScreen extends StatelessWidget {
  final String username;
  final String email;
  final String bio;
  final String organization;
  final String phone;

  const ProfileDetailScreen({
    super.key,
    required this.username,
    required this.email,
    required this.bio,
    required this.organization,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Username: $username"),
            SizedBox(height: 10),
            Text("Email: $email"),
            SizedBox(height: 10),
            Text("Bio: $bio"),
            SizedBox(height: 10),
            Text("Organization: $organization"),
            SizedBox(height: 10),
            Text("Phone: $phone"),
          ],
        ),
      ),
    );
  }
}
