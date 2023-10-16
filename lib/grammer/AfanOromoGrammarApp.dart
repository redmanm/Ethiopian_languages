import 'package:flutter/material.dart';

class AfanOromoGrammarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AfanOromoGrammarScreen(),
    );
  }
}

class AfanOromoGrammarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Afan Oromo Grammar'),
      ),
      body: AfanOromoGrammarList(),
    );
  }
}

class AfanOromoGrammarList extends StatefulWidget {
  @override
  _AfanOromoGrammarListState createState() => _AfanOromoGrammarListState();
}

class _AfanOromoGrammarListState extends State<AfanOromoGrammarList> {
  TextEditingController searchController = TextEditingController();
  List<AfanOromoGrammarTopic> filteredTopics = List.of(afanOromoGrammarTopics);

  @override
  void initState() {
    super.initState();
    searchController.addListener(filterTopics);
  }

  void filterTopics() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredTopics = afanOromoGrammarTopics
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
                subtitle: Text(topic.examples[0].english),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AfanOromoGrammarDetailScreen(topic: topic),
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

class AfanOromoGrammarDetailScreen extends StatelessWidget {
  final AfanOromoGrammarTopic topic;

  AfanOromoGrammarDetailScreen({this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
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
                  '${example.afanOromo} - ${example.english}',
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

class AfanOromoGrammarTopic {
  final String title;
  final List<Example> examples;
  final String explanation;

  AfanOromoGrammarTopic(this.title, this.examples, this.explanation);
}

class Example {
  final String afanOromo;
  final String english;

  Example(this.afanOromo, this.english);
}

List<AfanOromoGrammarTopic> afanOromoGrammarTopics = [
  AfanOromoGrammarTopic(
    'Nouns (Ishee)',
    [
      Example('magaalaa', 'city'),
      Example('ofiisii', 'office'),
      Example('hojii', 'book'),
    ],
    'Nouns (Ishee) in Afan Oromo are used to name people, places, things, or ideas. '
        'They can have different forms for singular and plural, and they are essential for constructing sentences.',
  ),
  AfanOromoGrammarTopic(
    'Verbs (Hinkeessa)',
    [
      Example('qabuu', 'to take'),
      Example('manni', 'to eat'),
      Example('jalaa', 'to run'),
    ],
    'Verbs (Hinkeessa) in Afan Oromo indicate actions or states of being. '
        'They are conjugated based on tense, person, number, and gender, and they are vital for sentence formation.',
  ),
  AfanOromoGrammarTopic(
    'Adjectives (Kuushu)',
    [
      Example('gara', 'big'),
      Example('cima', 'small'),
      Example('dhukkuba', 'good'),
    ],
    'Adjectives (Kuushu) in Afan Oromo describe nouns and provide additional information about them. '
        'They agree with nouns in gender, number, and case and enhance sentence descriptions.',
  ),
  AfanOromoGrammarTopic(
    'Pronouns (Namoota)',
    [
      Example('ani', 'I'),
      Example('isin', 'you'),
      Example('ijoolleen', 'they'),
    ],
    'Pronouns (Namoota) in Afan Oromo are used to replace nouns in sentences to avoid repetition. '
        'They have different forms for different persons and numbers.',
  ),
  AfanOromoGrammarTopic(
    'Prepositions (Lammaffa)',
    [
      Example('fi', 'in'),
      Example('bara', 'on'),
      Example('kutaa', 'under'),
    ],
    'Prepositions (Lammaffa) in Afan Oromo show the relationship between nouns and other words in a sentence. '
        'They indicate location, direction, time, and more.',
  ),
  AfanOromoGrammarTopic(
    'Conjunctions (Koo)',
    [
      Example('isa', 'and'),
      Example('kan', 'but'),
      Example('maaloo', 'or'),
    ],
    'Conjunctions (Koo) in Afan Oromo connect words, phrases, or clauses in a sentence. '
        'They help to join ideas and create compound sentences.',
  ),
  AfanOromoGrammarTopic(
    'Tenses (Harka)',
    [
      Example('ijoolleen qabuun', 'They are taking'),
      Example('ani kan itti qabuu', 'I will take it'),
      Example('ijoolleen gahuun', 'They ate'),
    ],
    'Tenses (Harka) in Afan Oromo indicate the time of an action. They include past, present, and future tenses, '
        'and they are marked on verbs.',
  ),
  AfanOromoGrammarTopic(
    'Questions (Afaan Uumama)',
    [
      Example('ee, isin abboolii?', 'Yes, are you a father?'),
      Example('haa, maaloo?', 'No, why?'),
      Example('wanti ammaa?', 'Who is that?'),
    ],
    'Questions (Afaan Uumama) in Afan Oromo are used to seek information. '
        'They can be formed by changing word order or using question words.',
  ),
  AfanOromoGrammarTopic(
    'Negation (Harka Harree)',
    [
      Example(
          'amma eessaan nama itti haqaaqan', 'But he didn\'t give me anything'),
      Example('ani jibba haata\'u', 'I won\'t go tomorrow'),
    ],
    'Negation (Harka Harree) in Afan Oromo is used to express the negative form of a verb or sentence. '
        'It often involves adding negation particles.',
  ),
  AfanOromoGrammarTopic(
    'Imperative Mood (Xumuree)',
    [
      Example('qabu!', 'Take!'),
      Example('galte!', 'Go!'),
      Example('garaa dhiisee!', 'Be quiet!'),
    ],
    'The imperative mood (Xumuree) in Afan Oromo is used to give commands, make requests, or offer invitations. '
        'It is often used with verbs.',
  ),
  AfanOromoGrammarTopic(
    'Definite and Indefinite Articles (Akkamii and Kan)',
    [
      Example('akkamii kitaaba', 'the book'),
      Example('kan hojii', 'a book'),
      Example('akkamii magaalaa', 'the city'),
      Example('kan ofiisii', 'an office'),
    ],
    'Afan Oromo uses definite article "akkamii" (the) and indefinite article "kan" (a or an) to indicate whether a noun is specific or non-specific. '
        'These articles are used with nouns and agree in gender and number.',
  ),

  AfanOromoGrammarTopic(
    'Possessive Pronouns (Namoota Xumurame)',
    [
      Example('anitti', 'my'),
      Example('isinti', 'your'),
      Example('ijoolleeni', 'their'),
    ],
    'Possessive pronouns in Afan Oromo indicate ownership or possession. '
        'They agree in gender and number with the noun they modify.',
  ),

  AfanOromoGrammarTopic(
    'Demonstrative Pronouns (Namoota Ka\'iyyoo)',
    [
      Example('kan', 'this'),
      Example('kana', 'that'),
      Example('kanuma', 'these'),
      Example('kanaan', 'those'),
    ],
    'Demonstrative pronouns in Afan Oromo are used to indicate the proximity or distance of objects in relation to the speaker. '
        'They agree with the noun in gender and number.',
  ),

  AfanOromoGrammarTopic(
    'Relative Clauses (Yeroo Bilisoomsaa)',
    [
      Example('hagam hojii kan qabaniin', 'the book that I took'),
      Example('ofiisii dargaggoota hundaan qabnu',
          'the office where the students are studying'),
    ],
    'Relative clauses in Afan Oromo provide additional information about a noun. They start with a relative pronoun and modify the noun.',
  ),

  AfanOromoGrammarTopic(
    'Passive Voice (Loltoonni)',
    [
      Example('hojii qabaniif', 'the book is taken'),
      Example('maqaan isin waaqayif', 'the food is eaten by you'),
    ],
    'The passive voice in Afan Oromo is used to show that the subject of the sentence receives the action rather than performs it. '
        'It is formed by conjugating the verb in passive voice.',
  ),

  AfanOromoGrammarTopic(
    'Direct and Indirect Objects (Ofuma fi Kufuma)',
    [
      Example('Ani kitabaa qabuu', 'I took the book (Direct Object)'),
      Example('Ani ofiisii nama qabu',
          'I gave the office to him (Indirect Object)'),
    ],
    'Afan Oromo uses direct and indirect objects to show the recipients or beneficiaries of actions. '
        'They are often marked by case markers and word order.',
  ),

  AfanOromoGrammarTopic(
    'Comparative and Superlative Forms (Kuushu Fi Ga\'umsaa)',
    [
      Example('garaa dhaabbatee', 'bigger than'),
      Example('garaa ga\'umsaan', 'the biggest'),
      Example('cimaa dhaabbatee', 'smaller than'),
      Example('cimaa ga\'umsaan', 'the smallest'),
    ],
    'Afan Oromo uses comparative and superlative forms to compare nouns and adjectives. '
        'These forms are used to express degrees of comparison, such as bigger, smaller, tallest, etc.',
  ),

  AfanOromoGrammarTopic(
    'Conditional Sentences (Qooddoo)',
    [
      Example('kan itti dhiqnu, maaloo?', 'If you go, why?'),
      Example('hojii isin if kennamu', 'If you eat the book'),
    ],
    'Conditional sentences in Afan Oromo are used to express hypothetical situations or conditions. '
        'They often begin with "kan" (if) and have a main clause describing the result.',
  ),

  AfanOromoGrammarTopic(
    'Passive Voice with Agent (Loltoonni Keessummaa)',
    [
      Example('hojii isin qabiif, ani naan dhiibbaa.',
          'The book was taken by you, I saw it. '),
      Example('kitaaba isin qabaniif, ofiisii namaa himani.',
          'The book was taken by you, the office was not given by him.'),
    ],
    'The passive voice with an agent in Afan Oromo is used to show that the subject receives the action and also mentions the doer of the action. '
        'It combines elements of the passive and active voices in a sentence.',
  ),

  AfanOromoGrammarTopic(
    'Causative Verbs (Achuma dubbii)',
    [
      Example('gudda qabuu', 'to cause to fall'),
      Example('ani aniitti itti hirkannaa', 'I made it myself'),
    ],
    'Causative verbs in Afan Oromo are used to express the idea of causing or making someone or something do an action. '
        'They are often formed by adding prefixes or suffixes to verbs.',
  ),

  AfanOromoGrammarTopic(
    'Infinitive Verbs (Hinkeessaa Turtii)',
    [
      Example('qabuu', 'to take'),
      Example('manni', 'to eat'),
      Example('garaa', 'to be big'),
    ],
    'Infinitive verbs in Afan Oromo are the base form of verbs and are used to express the action without specifying tense, person, or number. '
        'They are often used in verb conjugation and in sentences with auxiliary verbs.',
  ),

  AfanOromoGrammarTopic(
    'Exclamatory Sentences (Hojii Fuudhee)',
    [
      Example('Hayyuu!', 'Wow!'),
      Example('Dhaabne!', 'It\'s so big!'),
    ],
    'Exclamatory sentences in Afan Oromo are used to express strong emotions or surprise. '
        'They often begin with interjections like "Hayyuu!" or "Dhaabne!" to convey excitement or admiration.',
  ),

  AfanOromoGrammarTopic(
    'Participles (Achuma Keessa)',
    [
      Example('qaba', 'having taken'),
      Example('mannuu', 'having eaten'),
      Example('jalooti', 'those who run'),
    ],
    'Participles in Afan Oromo are verb forms used to describe actions or states. '
        'They can be used in various tenses and functions, such as gerunds and adjectives.',
  ),

  AfanOromoGrammarTopic(
    'Interrogative Pronouns (Namoota Afaan Uumama)',
    [
      Example('wanti', 'who'),
      Example('maali', 'what'),
      Example('matii', 'when'),
      Example('gara', 'where'),
    ],
    'Interrogative pronouns in Afan Oromo are used to ask questions about people, things, time, and location. '
        'They play a crucial role in forming interrogative sentences.',
  ),

  AfanOromoGrammarTopic(
    'Reflexive Verbs (Verbs with "hin" Prefix)',
    [
      Example('hinjibbu', 'to wash oneself'),
      Example('hinfudhannu', 'to dress oneself'),
      Example('hingahu', 'to run away (from oneself)'),
    ],
    'Reflexive verbs in Afan Oromo indicate that the subject of the verb performs the action on themselves. '
        'They are formed by adding the "hin" prefix to the base verb.',
  ),

  AfanOromoGrammarTopic(
    'Indirect Speech (Amaarraan Gadaa)',
    [
      Example('ani jedha, "ni dhukkubsuu?"', 'I asked, "Will you come?"'),
      Example('isini kun jedhii, "Hooggantoon dhukkubse!"',
          'They said to us, "The teacher will come!"'),
    ],
    'Indirect speech in Afan Oromo is used to report or convey what someone else has said or asked. '
        'It often involves changes in verb tenses and sentence structures.',
  ),

  AfanOromoGrammarTopic(
    'Inceptive Verbs (Verbs with "barru" Prefix)',
    [
      Example('barruu qabuu', 'to start taking'),
      Example('barruu galuu', 'to start going'),
      Example('barruu hojii nama qabu', 'to start giving a book'),
    ],
    'Inceptive verbs in Afan Oromo indicate the beginning or initiation of an action. '
        'They are formed by adding the "barru" prefix to the base verb.',
  ),

  AfanOromoGrammarTopic(
    'Phrasal Verbs (Fayyinaa Keessa)',
    [
      Example('hojii biraas', 'to read a book'),
      Example('garaa dhiisee', 'to become quiet'),
      Example('qabuu ofiisii garaa', 'to take an office seriously'),
    ],
    'Phrasal verbs in Afan Oromo are formed by combining a verb with one or more particles or prepositions. '
        'They often have unique meanings that may not be deducible from the individual words.',
  ),

  AfanOromoGrammarTopic(
    'Passive Voice with Beneficiary (Loltoonni Haalli)',
    [
      Example('hojii isin qabaniif, ani namni dhiibbaa.',
          'The book was taken by you for me, I saw it.'),
      Example('ofisii nama qabaniif, dargaggoota hundaan namaa himani.',
          'The office was taken by them for us, the students were not given by them.'),
    ],
    'The passive voice with a beneficiary in Afan Oromo is used to show that the subject receives the action, mentions the doer of the action, and includes a beneficiary or recipient of the action. '
        'It combines elements of the passive and active voices in a sentence.',
  ),

  AfanOromoGrammarTopic(
    'Evidentiality (Amsaa Kanaa)',
    [
      Example('itti fufee', 'I heard'),
      Example('itti kaasee', 'I saw'),
      Example('itti dubbatee', 'I know (based on information)'),
    ],
    'Evidentiality in Afan Oromo indicates the source or basis of information about an action or event. '
        'It is expressed through verb forms to convey whether the speaker witnessed, heard, inferred, or knows about the action.',
  ),

  AfanOromoGrammarTopic(
    'Reciprocal Verbs (Verbs with "afuu" Prefix)',
    [
      Example('afuun hojii', 'to exchange books'),
      Example('afuun isin hojjetu', 'they exchanged books with each other'),
    ],
    'Reciprocal verbs in Afan Oromo indicate actions that are performed by two or more participants on each other. '
        'They are formed by adding the "afuu" prefix to the base verb.',
  ),

  AfanOromoGrammarTopic(
    'Conditional Clauses (Qooddoo Bilisoomsaa)',
    [
      Example('kan itti dhiqnu, maaloo?', 'If you go, why?'),
      Example('hojii isin if kennamu', 'If you eat the book'),
    ],
    'Conditional clauses in Afan Oromo are used to express hypothetical conditions or situations. '
        'They often begin with "kan" (if) and have a main clause describing the result or consequence.',
  ),

  AfanOromoGrammarTopic(
    'Imperative with Negation (Xumuree fi Harka Harree)',
    [
      Example('qabuun hin harkaanu', 'Don\'t take it!'),
      Example('galte hin galanu', 'Don\'t go!'),
    ],
    'The imperative with negation in Afan Oromo is used to give negative commands or prohibitions. '
        'It is formed by adding "hin" (not) before the verb in the imperative mood.',
  ),

  AfanOromoGrammarTopic(
    'Vocative Case (Gosa Dibbee)',
    [
      Example('hojiituu!', 'Oh, book!'),
      Example('waayyoo!', 'Hey, friend!'),
    ],
    'The vocative case in Afan Oromo is used when addressing or calling someone or something directly. '
        'It often includes an exclamation to get the attention of the listener.',
  ),

  // Add more topics with examples and explanations as needed
];
