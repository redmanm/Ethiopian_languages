import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Aboutme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const About(),
    );
  }
}

class About extends StatelessWidget {
  const About({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/bglogin.webp'), // Replace with your background image path
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Your App Logo or Banner Image
                Image.asset(
                  'images/bachos1.jpg', // Replace with the path to your logo image
                  width: 150, // Adjust the width as needed
                  height: 150, // Adjust the height as needed
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to Ethiopian Languages',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'At Ethiopian Languages, our mission is to simplify the Languages preparation process, offer an efficient and provide access to a wealth of educational resources. We believe that our app can significantly benefit students by helping them excel in their studies and make informed academic decisions.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Our Mission',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Our mission is to empower students, simplify their educational journey, and enhance their academic achievements. With Ethiopian University, we strive to make higher education more accessible and help students achieve their goals.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Our Team',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color
                  ),
                ),
                const SizedBox(height: 10),
                // List of Team Members
                TeamMemberCard(
                  name: 'RM',
                  role: 'Founder/CEO',
                  description:
                      'The visionary leader behind Ethiopian Languages, RM, brings a wealth of experience in app development and a passion for improving higher education.',
                  phoneNumber: '+251940930471', // Add phone number
                  telegramUsername: 'redman03', // Add Telegram username
                ),
                TeamMemberCard(
                  name: 'Redwan Mudasir',
                  role: 'Developer',
                  description:
                      'Our coding genius, Redwan Mudasir, ensures that the app runs smoothly and efficiently.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutMePage(),
                      ),
                    );
                  },
                  phoneNumber: '+251940930471', // Add phone number
                  telegramUsername: 'redman03', // Add Telegram username
                ),

                // Add more TeamMemberCard widgets as needed for each team member
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String description;
  final VoidCallback onTap; // Add the onTap property
  final String phoneNumber; // Add phone number
  final String telegramUsername; // Add Telegram username

  const TeamMemberCard({
    key,
    this.name,
    this.role,
    this.description,
    this.onTap, // Make the onTap property optional
    this.phoneNumber, // Initialize phone number
    this.telegramUsername, // Initialize Telegram username
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap, // Use the onTap property here
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                role,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  // Phone Call Icon
                  IconButton(
                    icon: const Icon(Icons.call),
                    onPressed: () {
                      _launchPhoneCall(phoneNumber); // Launch phone call
                    },
                  ),
                  // Telegram Icon
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _openTelegram(telegramUsername); // Open Telegram
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to launch a phone call
  void _launchPhoneCall(String phoneNumber) async {
    final phoneUrl = 'tel:$phoneNumber';
    // ignore: deprecated_member_use
    if (await canLaunch(phoneUrl)) {
      // ignore: deprecated_member_use
      await launch(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }

  /// Function to open Telegram
  void _openTelegram(String username) async {
    final telegramUrl = 'https://t.me/$username';
    // ignore: deprecated_member_use
    if (await canLaunch(telegramUrl)) {
      // ignore: deprecated_member_use
      await launch(telegramUrl);
    } else {
      // If the Telegram app is not installed, try opening in a web browser
      final webUrl = 'https://t.me/$username';
      if (await canLaunch(webUrl)) {
        await launch(webUrl);
      } else {
        throw 'Could not launch $telegramUrl';
      }
    }
  }
}
