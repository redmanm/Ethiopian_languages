import 'package:ethiopian_languages/homepage/signup.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:url_launcher/url_launcher.dart';
import 'h.dart';

class signin extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<signin> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize Firebase Auth
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final User user = userCredential.user;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signed in with ${user.email}')),
      );

      // Navigate to the home page
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homepages(), // Use the EthiopiaHome widget
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'), // Update the title
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    'images/bglogin.webp',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                            child: SizedBox(
                              width: size.width * .9,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: size.width * .15,
                                        bottom: size.width * .1,
                                      ),
                                      child: Text(
                                        'SIGN IN',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white.withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    component(
                                      Icons.email_outlined,
                                      'Email...',
                                      false,
                                      true,
                                    ),
                                    component(
                                      Icons.lock_outline,
                                      'Password...',
                                      true,
                                      false,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                'forgot password', // Your Telegram username
                                            style: TextStyle(
                                              color: Colors
                                                  .blue, // You can use any color you prefer
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                final url =
                                                    'https://t.me/redman03'; // Replace with your Telegram username URL
                                                if (await canLaunch(url)) {
                                                  await launch(url);
                                                } else {
                                                  Fluttertoast.showToast(
                                                    msg:
                                                        'Could not launch Telegram.',
                                                  );
                                                }
                                              },
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Create a new Account',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                HapticFeedback.lightImpact();
                                                // Navigate to the Sign In page
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        signup(), // Replace with your Sign In page
                                                  ),
                                                );
                                              },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.width * .3),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap:
                                          _signInWithEmailAndPassword, // Call the Firebase sign-in function

                                      child: Container(
                                        margin: EdgeInsets.only(
                                          bottom: size.width * .05,
                                        ),
                                        height: size.width / 8,
                                        width: size.width / 1.25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(.1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          'Sing-In',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
