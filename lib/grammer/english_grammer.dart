import 'package:flutter/material.dart';
import 'english_grammar_data.dart';

class EnglishG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EnglishGrammarScreen(),
    );
  }
}

class EnglishGrammarScreen extends StatefulWidget {
  @override
  _EnglishGrammarScreenState createState() => _EnglishGrammarScreenState();
}

class _EnglishGrammarScreenState extends State<EnglishGrammarScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String searchText = '';

  List<EnglishGrammarLesson> grammarLessons =
      getGrammarLessons(); // Get lessons from data file
  List<EnglishGrammarLesson> filteredLessons = [];

  @override
  void initState() {
    super.initState();
    filteredLessons = grammarLessons;
  }

  void searchLessons(String query) {
    setState(() {
      searchText = query;
      if (query.isNotEmpty) {
        filteredLessons = grammarLessons
            .where((lesson) =>
                lesson.title.toLowerCase().contains(query.toLowerCase()) ||
                lesson.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredLessons = grammarLessons;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search English grammar lessons...',
                  border: InputBorder.none,
                ),
                onChanged: searchLessons,
              )
            : Text('English Grammar Learning App'),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      searchController.clear();
                      filteredLessons = grammarLessons;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredLessons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredLessons[index].title),
            subtitle: Text(filteredLessons[index].description),
            onTap: () {
              // Handle tapping on a lesson item
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LessonDetailScreen(
                    lesson: filteredLessons[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class LessonDetailScreen extends StatelessWidget {
  final EnglishGrammarLesson lesson;

  LessonDetailScreen({this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          lesson.description,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
