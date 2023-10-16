import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();
  DatabaseReference _feedbackRef;

  @override
  void initState() {
    super.initState();
    _feedbackRef = FirebaseDatabase.instance.reference().child('feedback');
  }

  void _submitFeedback() {
    String feedbackText = _feedbackController.text.trim();

    if (feedbackText.isNotEmpty) {
      _feedbackRef.push().set({
        'text': feedbackText,
        'timestamp': DateTime.now().toUtc().toString(),
      }).then((_) {
        _feedbackController.clear();
        _showSnackbar('Feedback submitted successfully!', true);
      }).catchError((error) {
        _showSnackbar(
            'Failed to submit feedback. Please try again later.', false);
      });
    } else {
      _showSnackbar('Please enter your feedback.', false);
    }
  }

  void _showSnackbar(String message, bool success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Page'),
        backgroundColor: Colors.teal, // Change to your desired app bar color
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Add an info dialog or navigate to an info page
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/bglogin.webp'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Give Us Your Feedback',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CustomFont', // Use your custom font here
                  color: Colors.white, // Change text color
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _feedbackController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Enter your feedback here...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitFeedback,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.send, // Add a send icon
                      color: Colors.white, // Change icon color
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Submit Feedback',
                      style: TextStyle(
                        fontFamily: 'CustomFont', // Use your custom font here
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
