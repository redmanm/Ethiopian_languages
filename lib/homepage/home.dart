import 'package:ethiopian_languages/homepage/youtube.dart';
import 'package:flutter/material.dart';

import '../about/about.dart';
import 'f.dart';

import '../quiz/quiz.dart';
import '../learn/learn.dart';
import '../dictionary/dictionary.dart';

import 'homepage.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NavDrawerExample extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<NavDrawerExample> {
  String userName = 'Redwan';
  String userEmail = 'redwanmudasir1@gmail.com';
  File _image; // Holds the selected image file

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
    _loadProfileImage();
  }

  _loadUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? userName;
      userEmail = prefs.getString('userEmail') ?? userEmail;
    });
  }

  Future<void> _updateUserDetails(String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);

    // Save the details to Firebase
    await saveUserDetailsToFirebase(name, email);

    setState(() {
      userName = name;
      userEmail = email;
    });
  }

  Future<void> saveUserDetailsToFirebase(String name, String email) async {
    final User user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Update the user's display name (optional but useful).
      await user.updateProfile(displayName: name);

      // Save additional user data to Firestore.
      await usersCollection.doc(user.uid).set({
        'name': name,
        'email': email,
      });
    }
  }

  _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profileImage');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  _saveProfileImage(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', imagePath);
  }

  Future<void> _showUserDetailsDialog() async {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update User Details'),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),

              SizedBox(height: 20), // Add spacing
              InkWell(
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: _image != null
                      ? FileImage(_image)
                      : AssetImage("images/bachos1.jpg") as ImageProvider,
                  radius: 50,
                ),
                onTap: () {
                  _pickImage();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String newName = nameController.text;
                String newEmail = emailController.text;
                _updateUserDetails(newName, newEmail);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imagePath = pickedFile.path;
      _saveProfileImage(imagePath);
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF43FBB),
        title: Text('Ethiopian University'),
      ),
      body: HomeScreen3(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(userEmail),
              currentAccountPicture: InkWell(
                onTap: () {
                  _showUserDetailsDialog();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: _image != null
                      ? FileImage(_image)
                      : AssetImage("assets/images/cap.jpg") as ImageProvider,
                ),
              ),
            ),
            ListTile(
              title: Text('Update User Details'),
              onTap: _showUserDetailsDialog,
            ),
            ListTile(
              leading: Icon(Icons.free_breakfast_sharp),
              title: const Text('Learn Grammar'),
              onTap: () => Navigator.of(context).push(_NewPage1(1)),
            ),
            ListTile(
              leading: Icon(Icons.quiz),
              title: const Text('Take Quiz'),
              onTap: () => Navigator.of(context).push(_NewPage2(1)),
            ),
            ListTile(
              leading: Icon(Icons.video_collection),
              title: const Text('Videos'),
              onTap: () => Navigator.of(context).push(_NewPage3(1)),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: const Text('Dictionary'),
              onTap: () => Navigator.of(context).push(_NewPage4(1)),
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: const Text('Feedback'),
              onTap: () => Navigator.of(context).push(_NewPage5(1)),
            ),
            ListTile(
              leading: Icon(Icons.logo_dev),
              title: const Text('About Us'),
              onTap: () => Navigator.of(context).push(_NewPage6(1)),
            ),
          ],
        ),
      ),
    );
  }
}

// <void> means this route returns nothing.
class _NewPage1 extends MaterialPageRoute<void> {
  _NewPage1(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              body: LearnScreen(),
            );
          },
        );
}

class _NewPage2 extends MaterialPageRoute<void> {
  _NewPage2(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              body: QuizScreen(),
            );
          },
        );
}

class _NewPage3 extends MaterialPageRoute<void> {
  _NewPage3(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(body: Youtube());
          },
        );
}

class _NewPage4 extends MaterialPageRoute<void> {
  _NewPage4(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              body: MultiLanguageDictionaryApp(),
            );
          },
        );
}

class _NewPage5 extends MaterialPageRoute<void> {
  _NewPage5(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              body: FeedbackPage(),
            );
          },
        );
}

class _NewPage6 extends MaterialPageRoute<void> {
  _NewPage6(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              body: About(),
            );
          },
        );
}
