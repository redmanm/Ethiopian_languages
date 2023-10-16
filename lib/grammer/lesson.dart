// import 'package:flutter/material.dart';
// import 'learn.dart';

// class EnglishLesson {
//   final String title;
//   final String description;

//   EnglishLesson({required this.title, required this.description});
// }

// class LessonDetailScreen extends StatelessWidget {
//   final EnglishLesson lesson;

//   LessonDetailScreen({required this.lesson});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lesson Details'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               // Implement search functionality here
//               showSearch(
//                 context: context,
//                 delegate: LessonSearchDelegate(),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               lesson.title,
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               lesson.description,
//               style: TextStyle(
//                 fontSize: 18.0,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             // Add more lesson details here, such as text, images, and exercises
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LessonSearchDelegate extends SearchDelegate<String> {
//   // Implement your search logic here
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // Implement the search results display here
//     return Center(
//       child: Text('Search results for: $query'),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // Implement search suggestions here
//     return Center(
//       child: Text('Suggestions for: $query'),
//     );
//   }
// }
