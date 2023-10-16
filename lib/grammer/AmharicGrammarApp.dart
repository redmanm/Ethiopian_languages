import 'package:flutter/material.dart';

class AmharicGrammarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AmharicGrammarScreen(),
    );
  }
}

class AmharicGrammarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amharic Grammar'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Handle exit or logout action
            },
          ),
        ],
      ),
      body: AmharicGrammarList(),
    );
  }
}

class AmharicGrammarList extends StatefulWidget {
  @override
  _AmharicGrammarListState createState() => _AmharicGrammarListState();
}

class _AmharicGrammarListState extends State<AmharicGrammarList> {
  TextEditingController searchController = TextEditingController();
  List<AmharicGrammarTopic> filteredTopics = List.of(amharicGrammarTopics);

  @override
  void initState() {
    super.initState();
    searchController.addListener(filterTopics);
  }

  void filterTopics() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredTopics = amharicGrammarTopics
          .where((topic) => topic.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search Topics',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredTopics.length,
            itemBuilder: (context, index) {
              final topic = filteredTopics[index];
              return ListTile(
                title: Text(topic.title),
                subtitle: Text(topic.examples[0].example),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AmharicGrammarDetailScreen(topic: topic),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class AmharicGrammarDetailScreen extends StatelessWidget {
  final AmharicGrammarTopic topic;

  AmharicGrammarDetailScreen({this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Examples:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            for (final example in topic.examples)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  example.example,
                ),
              ),
            SizedBox(height: 16.0),
            Text(
              'Explanation:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(topic.explanation),
          ],
        ),
      ),
    );
  }
}

class AmharicGrammarTopic {
  final String title;
  final List<Example> examples;
  final String explanation;

  AmharicGrammarTopic(this.title, this.examples, this.explanation);
}

class Example {
  final String example;

  Example(this.example, String s);
}

List<AmharicGrammarTopic> amharicGrammarTopics = [
  AmharicGrammarTopic(
    'Nouns (ሽርም)',
    [
      Example('መግቢያ', 'computer'),
      Example('ቤት', 'house'),
      Example('መልእክት', 'friends'),
      // Add more examples
    ],
    'Nouns (ሽርም) in Amharic are used to name people, places, things, or ideas. '
        'They can be singular or plural and play a crucial role in constructing sentences.',
  ),
  AmharicGrammarTopic(
    'Verbs (ፍርድ)',
    [
      Example('አይጣል', 'he/she is eating'),
      Example('አስታውሰው', 'they are learning'),
      Example('ተነስተ', 'we are going'),
      // Add more examples
    ],
    'Verbs (ፍርድ) in Amharic indicate actions or states of being. '
        'They are conjugated based on tense, person, number, and gender and are vital for sentence formation.',
  ),
  AmharicGrammarTopic(
    'Adjectives (ባለሞያ)',
    [
      Example('ቀሚስ', 'beautiful'),
      Example('ተማርኛ', 'Amharic (language)'),
      Example('ባህላዊ', 'national'),
      // Add more examples
    ],
    'Adjectives (ባለሞያ) in Amharic describe nouns and provide additional information about them. '
        'They agree with nouns in gender and number and enhance sentence descriptions.',
  ),

  AmharicGrammarTopic(
    'Prepositions (ግልጽ)',
    [
      Example('በመሄድ', 'under'),
      Example('በወቅት', 'during'),
      Example('እየገቡ', 'like'),
      // Add more examples
    ],
    'Prepositions (ግልጽ) in Amharic show the relationship between nouns and other words in a sentence. '
        'They indicate location, direction, time, and more.',
  ),

  AmharicGrammarTopic(
    'Conjunctions (ማደግ)',
    [
      Example('እንዴት', 'how'),
      Example('እና', 'and'),
      Example('ብቻ', 'but'),
      // Add more examples
    ],
    'Conjunctions (ማደግ) in Amharic connect words, phrases, or clauses in a sentence. '
        'They help to join ideas and create compound sentences.',
  ),

  AmharicGrammarTopic(
    'Tenses (ሰው፣ ሰማያ፣ ዓመት)',
    [
      Example('አይጠፋም', 'he/she didn\'t eat'),
      Example('አይገበድም', 'he/she won\'t read'),
      Example('አይኖርም', 'he/she didn\'t sleep'),
      // Add more examples
    ],
    'Tenses (ሰው፣ ሰማያ፣ ዓመት) in Amharic indicate the time of an action. '
        'They include past, present, and future tenses and are marked on verbs.',
  ),

  AmharicGrammarTopic(
    'Questions (ግላዊ ቁልፎች)',
    [
      Example('ምን ለው?', 'What is he doing?'),
      Example('ሰላም ይሁን', 'Hello, how are you?'),
      Example('ልን ነው?', 'Where is it?'),
      // Add more examples
    ],
    'Questions (ግላዊ ቁልፎች) in Amharic are used to seek information. '
        'They can be formed by changing word order or using question words like "ምን" (what), "ሰላም" (hello), and "ልን" (where).',
  ),

  AmharicGrammarTopic(
    'Possessive Pronouns (ምንጭ)',
    [
      Example('ሁሉም', 'all, everyone'),
      Example('እኛ', 'we, us'),
      Example('እኔ', 'I, me'),
      // Add more examples
    ],
    'Possessive pronouns (ምንጭ) in Amharic indicate ownership or possession. '
        'They are used to show who owns or possesses something and agree in gender and number with the possessed object.',
  ),

  AmharicGrammarTopic(
    'Relative Clauses (የተከበረ ርክት)',
    [
      Example('ሲኦል መገቢያ እስከ ማርያም ድጋሚ',
          'The computer that belongs to Solomon is expensive.'),
      Example('ቤት የሚባል የት ነው?', 'What kind of house is being built?'),
      // Add more examples
    ],
    'Relative clauses (የተከበረ ርክት) in Amharic provide additional information about a noun. '
        'They start with a relative pronoun like "የሚባል" (that belongs to) or "የሚከበረ" (that is expensive) and modify the noun.',
  ),

  AmharicGrammarTopic(
    'Imperative Mood (ስቡር)',
    [
      Example('ውድ!', 'Look!'),
      Example('ልባችን!', 'Lets go!'),
      // Add more examples
    ],
    'The imperative mood (ስቡር) in Amharic is used to give commands, make requests, or offer invitations. '
        'It is often used with verbs and can be both positive and negative.',
  ),

  AmharicGrammarTopic(
    'Exclamatory Sentences (አስተማሪ ቁልፎች)',
    [
      Example('አዎ!', 'Wow!'),
      Example('እንዴት ነሽ!', 'You are amazing!'),
      // Add more examples
    ],
    'Exclamatory sentences (አስተማሪ ቁልፎች) in Amharic are used to express strong emotions, surprise, admiration, or excitement. '
        'They often begin with interjections like "አዎ!" (Wow) or "እንዴት" (how).',
  ),

  AmharicGrammarTopic(
    'Conditional Clauses (ስታወረድ ቁልፎች)',
    [
      Example('ለመሄድ የሚቻል ማን ነው?', 'Who is someone who can solve it?'),
      Example('ለምግብ የሚገባለት ምንድነው?',
          'What is something that is necessary for education?'),
      // Add more examples
    ],
    'Conditional clauses (ስታወረድ ቁልፎች) in Amharic are used to express hypothetical conditions or situations. '
        'They often begin with "ለ" (for) and include a relative clause describing the condition.',
  ),

  AmharicGrammarTopic(
    'Passive Voice (ትታወረድ)',
    [
      Example('ቤት ተታወረው', 'The house was built'),
      Example('አስታውሰው ተታወረ', 'They were taught'),
    ],
    'The passive voice (ትታወረድ) in Amharic is used to show that the subject receives the action rather than performs it. '
        'It is formed by using the verb in the passive form.',
  ),

  AmharicGrammarTopic(
    'Causative Verbs (ማታወረድ)',
    [
      Example('አስታውሰው', 'They taught (caused to learn)'),
      Example('አስተማረው', 'They amazed (caused to be amazed)'),
    ],
    'Causative verbs (ማታወረድ) in Amharic indicate that the subject causes someone else to perform an action. '
        'They are formed by adding prefixes to the base verb.',
  ),

  AmharicGrammarTopic(
    'Infinitive Verbs (መለያ ፍርድ)',
    [
      Example('መለየት', 'to learn'),
      Example('መብላት', 'to teach'),
    ],
    'Infinitive verbs (መለያ ፍርድ) in Amharic are the base form of verbs. '
        'They are used to express the action in its simplest form and can be used with auxiliary verbs.',
  ),

  AmharicGrammarTopic(
    'Evidentiality (ሂደት)',
    [
      Example(
          'በራሴ እንደገቡ ነበር', 'He must have come to Baresi (based on hearsay)'),
      Example('እኔ ደግሞ የማይገቡ ነኝ',
          'I know that I am not late (based on direct knowledge)'),
    ],
    'Evidentiality (ሂደት) in Amharic indicates the source or basis of information about an action or event. '
        'It is expressed through verb forms to convey whether the speaker witnessed, heard, inferred, or knows about the action.',
  ),

  AmharicGrammarTopic(
    'Reciprocal Verbs (በልጠፍ)',
    [
      Example('አስቀድሞ ተታወረ', 'They met each other'),
      Example('ሲሰጥ በልጠፍ', 'They help each other'),
    ],
    'Reciprocal verbs (በልጠፍ) in Amharic indicate actions performed by two or more participants on each other. '
        'They are formed by adding the prefix "በ" (with) to the base verb.',
  ),
  AmharicGrammarTopic(
    'Comparative and Superlative Forms (መጠቀሚያ እና መጠቀሚያ)',
    [
      Example('በጣም አይደለም፣ በእርግጥ አያደርገም',
          'He is not as brave as you, he is not as strong as her'),
      Example('ሀበሻ ብለሽ ብሎሽ ነሽ', 'You are taller than him and taller than her'),
    ],
    'Comparative and superlative forms (መጠቀሚያ እና መጠቀሚያ) in Amharic are used to compare and rank things or qualities. '
        'They are formed by adding suffixes like "ብለ" (than) and "ነሽ" (the most).',
  ),

  AmharicGrammarTopic(
    'Passive Conjugation (የታወረዉ ቆጣሪ)',
    [
      Example('ሕግ ተታወረች', 'The law was legislated'),
      Example('ተማረዉ', 'It was known'),
    ],
    'Passive conjugation (የታወረዉ ቆጣሪ) in Amharic is used to create passive forms of verbs. '
        'It involves changes in verb endings to indicate the passive voice.',
  ),

  AmharicGrammarTopic(
    'Gender Agreement (ብሔራዊ ስእሊ)',
    [
      Example('ብሔር ሰው', 'a wise man (masculine)'),
      Example('ብሔሮች ተታወረዉ', 'the wise people (plural)'),
      Example('ብሔራዊ ሴቶች', 'wise women (feminine)'),
    ],
    'Gender agreement (ብሔራዊ ስእሊ) in Amharic involves matching nouns, pronouns, and adjectives with the gender of the noun they modify. '
        'Nouns can be masculine or feminine, and modifiers must agree in gender.',
  ),

  AmharicGrammarTopic(
    'Vocative Case (ንግግር አጽዕር)',
    [
      Example('ልባችን!', 'Hey, let\'s go!'),
      Example('አዎ!', 'Wow!'),
    ],
    'The vocative case (ንግግር አጽዕር) in Amharic is used to address or call someone or something directly. '
        'It is often marked with an exclamation to get the listener\'s attention.',
  ),
  AmharicGrammarTopic(
    'Participles (ሽንቦች)',
    [
      Example('በጥሩ የሚሰጠው መጻሕፍ', 'The book that is on the table'),
      Example('በትኩስ የሚታይ ሰው', 'The person who is intelligent'),
    ],
    'Participles (ሽንቦች) in Amharic are verb forms that function as adjectives. '
        'They describe nouns and are often used to provide additional information about them.',
  ),

  AmharicGrammarTopic(
    'Indirect Speech (መዝሙር ድጋፍ)',
    [
      Example('የአንተ እውነት እረሳለሁ', 'I will tell you what your name is'),
      Example('በአድማሱ የሚገባ እኔ ነኝ', 'I am the one who lives in Addis Ababa'),
    ],
    'Indirect speech (መዝሙር ድጋፍ) in Amharic is used to report or convey someone else\'s words or thoughts. '
        'It often involves changes in verb forms and pronouns.',
  ),

  AmharicGrammarTopic(
    'Double Negatives (ቀጣይ ጉእና)',
    [
      Example('በዚህ ጉእና አላት', 'He is not here at all'),
      Example('ምንድን ነው ማንም አያገባም', 'Nobody knows who it is'),
    ],
    'Double negatives (ቀጣይ ጉእና) in Amharic are used for emphasis. '
        'They involve the use of two or more negative elements in a sentence to strengthen the negation.',
  ),

  AmharicGrammarTopic(
    'Idiomatic Expressions (ስብስባሞች)',
    [
      Example('ሃገርን ለዘለዓለም ልቅረቡ',
          'To move mountains for someone (idiomatic expression)'),
      Example('ስቃይ አልኩት', 'It s raining cats and dogs (idiomatic expression)'),
    ],
    'Idiomatic expressions (ስብስባሞች) in Amharic are phrases or sentences whose meaning is not deducible from the individual words used. '
        'They often carry figurative or metaphorical meanings.',
  ),
  AmharicGrammarTopic(
    'Conditional Sentences (ቆጣሪ ቁልፎች)',
    [
      Example('ስለዚህ ሁሉም ነገሩን ተማረው', 'If it is about this, everyone knows it'),
      Example('አንድ የሚሰጣው ሲኦል ምንድነው?',
          'What is Solomon, who is a wise man, known for?'),
    ],
    'Conditional sentences (ቆጣሪ ቁልፎች) in Amharic are used to express conditions and their consequences. '
        'They often involve the use of "ስለ" (if) or conditional verb forms.',
  ),

  AmharicGrammarTopic(
    'Interrogative Pronouns (ግላዊ ፍርድዌር)',
    [
      Example('ምን', 'What'),
      Example('ምንም', 'Anything'),
      Example('ምናም', 'Nothing'),
    ],
    'Interrogative pronouns (ግላዊ ፍርድዌር) in Amharic are used to ask questions and seek information. '
        'They include words like "ምን" (what), "ምንም" (anything), and "ምናም" (nothing).',
  ),

  AmharicGrammarTopic(
    'Emphatic Particles (ቀጣይ ጉእና)',
    [
      Example('አንተንም እንደዚህ ያለውን ነገር አላስገድለንም',
          'We didn\'t do anything to you, either'),
      Example('ስለሚያዝን ነገር የአስታውሳት ዓመት ተቀነስቆ አስታውሳለሁ',
          'I will definitely teach you everything you want to know'),
    ],
    'Emphatic particles (ቀጣይ ጉእና) in Amharic are used to add emphasis or strengthen a statement. '
        'They include words like "ነገር" (thing), "አላስገድለን" (we didn\'t do anything), and "ተቀነስቆ" (definitely).',
  ),

  AmharicGrammarTopic(
    'Expletive Sentences (አስማማዎች)',
    [
      Example('አንዳችን የማይታይ ደግሞ ተገኘን', 'We all, without exception, succeeded'),
      Example('ለእኛም ታጥቦ ነበር', 'We were all tired'),
    ],
    'Expletive sentences (አስማማዎች) in Amharic use "አንዳችን" (all of us) or similar phrases to emphasize that something applies to everyone in a group.',
  ),
  AmharicGrammarTopic(
    'Reflexive Pronouns (ምንም ፍርድ)',
    [
      Example('አበባዬ እንደዚህ ያለው ነው', 'My brother is the one who did it himself'),
      Example('በትኩስ እኔ እንዴት ተነስቶልኛል', 'I can do it by myself in the library'),
    ],
    'Reflexive pronouns (ምንም ፍርድ) in Amharic indicate that the subject of the verb is also the object, performing the action on themselves. '
        'They include words like "እኔ" (I), "አበባዬ" (my brother), and "ተነስቶልኛል" (I can do it by myself).',
  ),

  AmharicGrammarTopic(
    'Temporal Expressions (ቀጣይ ቆማዬዎች)',
    [
      Example('በዚህ ወንድማማች ላይ', 'In this moment or right now'),
      Example('ከሰዓት ወዲያ', 'Before sunset'),
    ],
    'Temporal expressions (ቀጣይ ቆማዬዎች) in Amharic are used to indicate time or when an action occurred. '
        'They include words and phrases like "በዚህ" (now), "ከሰዓት" (from the morning), and "ወዲያ" (before).',
  ),

  AmharicGrammarTopic(
    'Comparatives of Equality (የሚታይ መጠቀሚያ)',
    [
      Example('አንድ ቀን ብቻ ነው ያለው', 'One day is just like the other'),
      Example('የሚታይ ምንም የለም', 'It\'s not the same as anything'),
    ],
    'Comparatives of equality (የሚታይ መጠቀሚያ) in Amharic are used to express that two things or qualities are equal or the same. '
        'They often use phrases like "እንደዚህ" (just like this) or "የሚታይ ምንም" (not the same as anything).',
  ),

  AmharicGrammarTopic(
    'Subjunctive Mood (የተከፈለበት ግላዎች)',
    [
      Example('የሚስቶ ያለብኝ', 'May you be blessed like Mary'),
      Example('ምን አያውቅም', 'It doesn\'t matter what they say'),
    ],
    'The subjunctive mood (የተከፈለበት ግላዎች) in Amharic is used to express wishes, suggestions, or hypothetical situations. '
        'It often involves the use of verbs in different forms to indicate the subjunctive mood.',
  ),
  AmharicGrammarTopic(
    'Conditional Particles (ቀጣይ ቆማዎች)',
    [
      Example('እዚህ ያለበት ነገር ይሆናል', 'If what you say is true'),
      Example('የሚያስቡት ግን ልጆቹ ያጠቁት',
          'But if they don\'t agree, the children will refuse'),
    ],
    'Conditional particles (ቀጣይ ቆማዎች) in Amharic are used to introduce conditional clauses. '
        'They include words like "እዚህ" (if), "ግን" (but), and "ይሆናል" (will be).',
  ),

  AmharicGrammarTopic(
    'Attributive Particles (እንደገና ቆማዎች)',
    [
      Example('ስለዚህ እንደገና ምንድነው?', 'What is this like?'),
      Example('እንደገና ምንም የለም', 'It\'s not like anything'),
    ],
    'Attributive particles (እንደገና ቆማዎች) in Amharic are used to make comparisons or describe the similarity of things. '
        'They include phrases like "ስለዚህ" (about this) and "ምንድነው?" (what is it like?).',
  ),

  AmharicGrammarTopic(
    'Definite and Indefinite Articles (ምንጭር እና ምርት)',
    [
      Example('ሀገሬን የምንጭር ቆማዋን አድርገን', 'We brought the fruits to the village'),
      Example('ሀገሬን የምርት ቆማዋን አድርገን', 'We brought fruits to the village'),
    ],
    'Definite and indefinite articles (ምንጭር እና ምርት) in Amharic are used to indicate whether a noun is specific or general. '
        'The definite article is "የ" (the), and the indefinite article is "የምንጭር" (a/an).',
  ),

  AmharicGrammarTopic(
    'Relative Clauses (ምክትል ደረጃ)',
    [
      Example('የአባት ስም ያለበት የአገር', 'The country whose name is the father'),
      Example(
          'ስለዚህ ምክትል ደረጃ እንደሚቀጥል', 'Like this kind of situation that happens'),
    ],
    'Relative clauses (ምክትል ደረጃ) in Amharic are used to provide additional information about a noun. '
        'They are introduced by words like "የ" (whose) and "ስለ" (like/about this).',
  ),

  // Add more grammar topics with examples and explanations as needed
];

void loadGrammarData() {
  // Load more grammar topics and examples here
}
