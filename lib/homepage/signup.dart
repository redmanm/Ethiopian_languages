import 'package:ethiopian_languages/homepage/signin.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'h.dart'; // Import Firebase Auth

class signup extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize Firebase Auth
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // New controller for confirm password
  final TextEditingController _userNameController = TextEditingController();

  Future<void> _signUpWithEmailAndPassword() async {
    try {
      if (_passwordController.text == _confirmPasswordController.text) {
        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        final User user = userCredential.user;
        await user.updateDisplayName(_userNameController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signed up with ${user.email}')),
        );

        // Navigate to the home page
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => homepages(), // Use the EthiopiaHome widget
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign up: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
                                        'SIGN UP',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white.withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    component(
                                      Icons.account_circle_outlined,
                                      'User name...',
                                      false,
                                      false,
                                      controller: _userNameController,
                                    ),
                                    component(
                                      Icons.email_outlined,
                                      'Email...',
                                      false,
                                      true,
                                      controller: _emailController,
                                    ),
                                    component(
                                      Icons.lock_outline,
                                      'Password...',
                                      true,
                                      false,
                                      controller: _passwordController,
                                    ),
                                    component(
                                      Icons
                                          .lock_outline, // Icon for confirm password
                                      'Confirm Password...',
                                      true,
                                      false,
                                      controller:
                                          _confirmPasswordController, // Assign the confirm password controller
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: 'Sign in',
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
                                                        signin(), // Replace with your Sign In page
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
                                          _signUpWithEmailAndPassword, // Call the Firebase sign-up function
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
                                          'Sign Up',
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
      IconData icon, String hintText, bool isPassword, bool isEmail,
      //{TextEditingController? controller}) {

      {TextEditingController controller}) {
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
        controller: controller, // Assign the controller for this field
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
