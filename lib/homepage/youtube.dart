import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Youtube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: YouTubePlayerDemo(
        videoLink: 'https://youtu.be/Vg3kBcONUBY?feature=shared',
        channelLink: 'https://www.youtube.com/@redwan1_1',
      ),
    );
  }
}

class YouTubePlayerDemo extends StatefulWidget {
  final String videoLink;
  final String channelLink;

  YouTubePlayerDemo({this.videoLink, this.channelLink});

  @override
  _YouTubePlayerDemoState createState() => _YouTubePlayerDemoState();
}

class _YouTubePlayerDemoState extends State<YouTubePlayerDemo> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Extract the video ID from the provided link
    String videoId = YoutubePlayer.convertUrlToId(widget.videoLink) ?? "";

    // Initialize the controller
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  Future<void> _subscribeToChannel() async {
    // Open the YouTube channel link in a web browser
    final url = widget.channelLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Video Player '),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _subscribeToChannel,
            child: Text('Subscribe to Channel'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
