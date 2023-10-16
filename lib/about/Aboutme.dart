import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMePage extends StatelessWidget {
  AboutMePage({Key key});

  _launchPhone() async {
    const phoneUrl = 'tel:+251940930471';
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }

  _launchTelegram() async {
    const telegramUrl = 'https://t.me/redman03';
    if (await canLaunch(telegramUrl)) {
      await launch(telegramUrl);
    } else {
      throw 'Could not launch $telegramUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bglogin.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/redwan.png'),
                radius: 80.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Redwan Mudasir',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Software Engineering - 4th Year in ASTU',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Contact Information:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: _launchPhone,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.call, // Call icon
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      'Phone: +251940930471',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: _launchTelegram,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.send, // Telegram icon
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      'Telegram: @redman03',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'GitHub: redmanm',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutMePage(),
  ));
}
