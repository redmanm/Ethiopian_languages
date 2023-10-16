import 'package:flutter/material.dart';

class ArabicGrammarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ArabicGrammarScreen(),
    );
  }
}

class ArabicGrammarScreen extends StatefulWidget {
  @override
  _ArabicGrammarScreenState createState() => _ArabicGrammarScreenState();
}

class _ArabicGrammarScreenState extends State<ArabicGrammarScreen> {
  TextEditingController searchController = TextEditingController();
  List<ArabicGrammarTopic> filteredTopics = List.of(arabicGrammarTopics);

  @override
  void initState() {
    super.initState();
    searchController.addListener(filterTopics);
  }

  void filterTopics() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredTopics = arabicGrammarTopics
          .where((topic) => topic.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arabic Grammar'),
      ),
      body: Column(
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ArabicGrammarDetailScreen(topic: topic),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ArabicGrammarDetailScreen extends StatelessWidget {
  final ArabicGrammarTopic topic;

  ArabicGrammarDetailScreen({this.topic});

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

class ArabicGrammarTopic {
  final String title;
  final List<Example> examples;
  final String explanation;

  ArabicGrammarTopic(this.title, this.examples, this.explanation);
}

class Example {
  final String example;

  Example(this.example, String s);
}

List<ArabicGrammarTopic> arabicGrammarTopics = [
  ArabicGrammarTopic(
    'Nouns (الأسماء)',
    [
      Example('كتاب', 'book'),
      Example('مدرسة', 'school'),
      // Add more examples
    ],
    'Nouns (الأسماء) are used to name people, places, things, or ideas. '
        'They can be singular or plural and play a crucial role in constructing sentences.',
  ),
  ArabicGrammarTopic(
    'Verbs (الأفعال)',
    [
      Example('يقرأ', 'reads'),
      Example('يكتب', 'writes'),
      // Add more examples
    ],
    'Verbs (الأفعال) in Arabic indicate actions or states of being. '
        'They are conjugated based on tense, person, number, and gender and are vital for sentence formation.',
  ),
  ArabicGrammarTopic(
    'Adjectives (الصفات)',
    [
      Example('جميل', 'beautiful'),
      Example('كبير', 'big'),
      // Add more examples
    ],
    'Adjectives (الصفات) in Arabic describe nouns and provide additional information about them. '
        'They agree with nouns in gender, number, and case and enhance sentence descriptions.',
  ),

  ArabicGrammarTopic(
    'Definite and Indefinite Articles (التعريف والنكرة)',
    [
      Example('الكتاب', 'the book'),
      Example('كتاب', 'a book'),
    ],
    'Definite (التعريف) and indefinite (النكرة) articles in Arabic are used to indicate whether a noun is specific or general. '
        'The definite article is "ال" (al), and the indefinite article is omitted before singular nouns.',
  ),

  ArabicGrammarTopic(
    'Prepositions (الحروف الجر)',
    [
      Example('في', 'in'),
      Example('على', 'on'),
      // Add more examples
    ],
    'Prepositions (الحروف الجر) in Arabic are used to show the relationship between nouns and other elements in a sentence. '
        'They are essential for indicating location, time, and more.',
  ),

  ArabicGrammarTopic(
    'Pronouns (الضمائر)',
    [
      Example('أنا', 'I'),
      Example('هو', 'he'),
      // Add more examples
    ],
    'Pronouns (الضمائر) in Arabic replace nouns and are used to avoid repetition. '
        'They vary in gender, number, and person and are an integral part of Arabic sentences.',
  ),

  ArabicGrammarTopic(
    'Tenses (الأزمنة)',
    [
      Example('يقرأ', 'reads (present)'),
      Example('قرأ', 'read (past)'),
      // Add more examples
    ],
    'Tenses (الأزمنة) in Arabic indicate when an action took place. '
        'They include the present, past, and future tenses, each with its own conjugation rules.',
  ),

  ArabicGrammarTopic(
    'Conjunctions (العُطف)',
    [
      Example('و', 'and'),
      Example('أو', 'or'),
      // Add more examples
    ],
    'Conjunctions (العُطف) in Arabic are used to connect words, phrases, or clauses in a sentence. '
        'They play a crucial role in expressing relationships and adding complexity to sentences.',
  ),
  ArabicGrammarTopic(
    'Interrogative Pronouns (الضمائر الاستفهامية)',
    [
      Example('مَن', 'who'),
      Example('ماذا', 'what'),
      Example('أين', 'where'),
      // Add more examples
    ],
    'Interrogative pronouns (الضمائر الاستفهامية) in Arabic are used to ask questions and seek information. '
        'They include words like "مَن" (who), "ماذا" (what), and "أين" (where).',
  ),

  ArabicGrammarTopic(
    'Dual Form (المثنى)',
    [
      Example('كتابَيْن', 'two books'),
      Example('وَلَدَيْن', 'two boys'),
    ],
    'The dual form (المثنى) in Arabic is used to indicate two of something. It is formed by adding specific suffixes to nouns, pronouns, and verbs.',
  ),

  ArabicGrammarTopic(
    'Sound and Broken Plurals (الجمع)',
    [
      Example('كُتُب', 'books (sound plural)'),
      Example('أَسْئِلَة', 'questions (broken plural)'),
    ],
    'Arabic nouns can form plurals in different ways. Sound plurals (الجمع السالم) follow regular patterns, while broken plurals (الجمع الكسري) have irregular forms.',
  ),

  ArabicGrammarTopic(
    'Conditional Sentences (الجمل الشرطية)',
    [
      Example('إذا درست جيدًا، ستنجح', 'If you study well, you will succeed'),
      Example('لو كان عندي وقت، سافرت', 'If I had time, I would travel'),
    ],
    'Conditional sentences (الجمل الشرطية) in Arabic are used to express conditions and their consequences. They often involve the use of conjunctions like "إذا" (if) and "لو" (if, for hypothetical situations).',
  ),

  ArabicGrammarTopic(
    'Passive Voice (المبني للمجهول)',
    [
      Example('تم كتابة الرسالة', 'The letter was written'),
      Example('سُرِقَ الهاتف', 'The phone was stolen'),
    ],
    'The passive voice (المبني للمجهول) in Arabic is used to focus on the action rather than the doer. It is formed using specific verb forms and structures.',
  ),

  ArabicGrammarTopic(
    'Nominal Sentences (الجمل الاسمية)',
    [
      Example('الكتاب جميل', 'The book is beautiful'),
      Example('المدينة كبيرة', 'The city is big'),
    ],
    'Nominal sentences (الجمل الاسمية) in Arabic consist of a subject and a predicate, both of which are nouns or adjectives. They are used to make statements or describe things.',
  ),
  ArabicGrammarTopic(
    'Verbal Nouns (الأسماء المصدرية)',
    [
      Example('القراءة', 'reading'),
      Example('الكتابة', 'writing'),
    ],
    'Verbal nouns (الأسماء المصدرية) in Arabic are derived from verbs and indicate actions or processes. '
        'They are often used to form infinitive phrases and gerunds.',
  ),

  ArabicGrammarTopic(
    'Adverbs (الظروف)',
    [
      Example('سريعاً', 'quickly'),
      Example('جيدًا', 'well'),
    ],
    'Adverbs (الظروف) in Arabic modify verbs, adjectives, or other adverbs and provide information about how an action is performed. '
        'They are often formed by adding specific suffixes to adjectives.',
  ),

  ArabicGrammarTopic(
    'Comparative and Superlative Degrees (درجات التفضيل والتفوق)',
    [
      Example('أسرع', 'faster (comparative)'),
      Example('أسرع من أي وقت مضى', 'fastest ever (superlative)'),
    ],
    'Comparative and superlative degrees (درجات التفضيل والتفوق) in Arabic are used to compare the qualities of two or more things. '
        'They are formed by adding specific prefixes and suffixes to adjectives.',
  ),

  ArabicGrammarTopic(
    'Subjunctive Mood (الوجه الآتي)',
    [
      Example('لو كان لدي وقت، لسافرت', 'If I had time, I would travel'),
      Example('ماذا تفعل لو فازت؟', 'What will you do if she wins?'),
    ],
    'The subjunctive mood (الوجه الآتي) in Arabic is used to express hypothetical or future possibilities. '
        'It often involves the use of conditional sentences with verbs in the subjunctive form.',
  ),

  ArabicGrammarTopic(
    'Dual Pronouns (الضمائر المثناة)',
    [
      Example('هما', 'they both'),
      Example('أنتما', 'you both'),
    ],
    'Dual pronouns (الضمائر المثناة) in Arabic are used to refer to two people or things. '
        'They are often used with verbs and adjectives that agree in the dual form.',
  ),

  ArabicGrammarTopic(
    'Imperative Mood (الوجه الأمري)',
    [
      Example('اقرأ الكتاب', 'Read the book'),
      Example('لا تتأخر', 'Don\'t be late'),
    ],
    'The imperative mood (الوجه الأمري) in Arabic is used to give commands or make requests. '
        'It often involves the use of verbs in the imperative form.',
  ),
  ArabicGrammarTopic(
    'Genitive Construction (الإضافة)',
    [
      Example('بيت الطالب', 'the student\'s house'),
      Example('سيارة أحمد', 'Ahmed\'s car'),
    ],
    'The genitive construction (الإضافة) in Arabic is used to show possession or association between two nouns. '
        'It often involves placing one noun in the genitive case after another.',
  ),

  ArabicGrammarTopic(
    'Conditional Particles (أدوات الشرط)',
    [
      Example('إذا', 'if'),
      Example('لو', 'if, in case of'),
    ],
    'Conditional particles (أدوات الشرط) in Arabic are used to introduce conditional clauses. '
        'They play a crucial role in forming conditional sentences, indicating the condition and result.',
  ),

  ArabicGrammarTopic(
    'Active and Passive Participles (الأسماء المشتقة)',
    [
      Example('مقرئ', 'reader (active participle)'),
      Example('مقروء', 'read (passive participle)'),
    ],
    'Active and passive participles (الأسماء المشتقة) in Arabic are derived from verbs and function as nouns. '
        'They describe the doer of an action (active) or the receiver of an action (passive).',
  ),

  ArabicGrammarTopic(
    'Conditional Mood (المضارع المشروط)',
    [
      Example('سأذهب إذا استطعت', 'I will go if I can'),
      Example('ستشتري الكتاب لو جاء', 'You will buy the book if he comes'),
    ],
    'The conditional mood (المضارع المشروط) in Arabic is used to express future actions that are conditional or dependent on certain circumstances. '
        'It often involves the use of the present tense with conditional particles.',
  ),

  ArabicGrammarTopic(
    'Dual and Plural Pronouns (الضمائر المثنى والجمع)',
    [
      Example('هما يذهبان', 'They both go'),
      Example('هم يذهبون', 'They go'),
    ],
    'Arabic pronouns have forms for the dual and plural. The dual form is used when referring to two individuals or things, '
        'while the plural form is used for more than two.',
  ),

  ArabicGrammarTopic(
    'Negation (النفي)',
    [
      Example('ليس هناك وقت', 'There is no time'),
      Example('لا تكتب', 'Don\'t write'),
    ],
    'Negation (النفي) in Arabic is used to express the absence or denial of an action or state. '
        'It often involves using words like "لا" (no) or "ليس" (not) before verbs or nouns.',
  ),
  ArabicGrammarTopic(
    'Conditional Sentences Type 2 (الجمل الشرطية من النوع الثاني)',
    [
      Example('لو درست بجد، ستجتاز الامتحان',
          'If you studied hard, you would pass the exam'),
      Example('لو كان لدي وقت أكثر، سأقرأ الكتاب كاملاً',
          'If I had more time, I would read the whole book'),
    ],
    'Conditional sentences of the second type (الجمل الشرطية من النوع الثاني) in Arabic express unreal or hypothetical conditions in the present or future. They often involve the use of "لو" (if) and the past tense verb in the conditional clause.',
  ),

  ArabicGrammarTopic(
    'Conditional Sentences Type 3 (الجمل الشرطية من النوع الثالث)',
    [
      Example('لو كنت قد درست، لكنت اجتزت الامتحان',
          'If you had studied, you would have passed the exam'),
      Example('لو لم تكن مريضًا، كنت سافرت معنا',
          'If you weren\'t sick, you would have traveled with us'),
    ],
    'Conditional sentences of the third type (الجمل الشرطية من النوع الثالث) in Arabic express unreal or hypothetical conditions in the past. They often involve the use of "لو" (if) and the past perfect tense verb in the conditional clause.',
  ),

  ArabicGrammarTopic(
    'Subjunctive Mood (الوجه المنصوب)',
    [
      Example('ليذهب', 'Let him go'),
      Example('لنأكل', 'Let\'s eat'),
    ],
    'The subjunctive mood (الوجه المنصوب) in Arabic is used to express requests, wishes, or suggestions. It is often formed using the present tense verb without subject pronouns.',
  ),

  ArabicGrammarTopic(
    'Adjective Agreement with Gender and Number (اتفاق الصفة مع الجنس والعدد)',
    [
      Example('المدرس الجديد', 'The new male teacher'),
      Example('المدرسة الجديدة', 'The new female teacher'),
      Example('الأصدقاء السعداء', 'The happy friends'),
    ],
    'In Arabic, adjectives must agree in gender and number with the nouns they modify. This means that the form of the adjective changes to match the gender and number of the noun it describes.',
  ),

  ArabicGrammarTopic(
    'Elision of the Definite Article (ألف اللام)',
    [
      Example('البيت الكبير', 'The big house'),
      Example('الوالد الحنون', 'The loving father'),
    ],
    'In some cases, the definite article "ال" (the) elides (loses its "ا" sound) when it comes before a word that starts with certain letters or sounds, such as "البيت الكبير" becoming "البيت الكبير" for easier pronunciation.',
  ),
  ArabicGrammarTopic(
    'Exclamatory Sentences (الجمل التعجبية)',
    [
      Example('ما أجمل هذا المكان!', 'How beautiful this place is!'),
      Example('ماذا تفعل هذه اللوحة!', 'What is this painting!'),
    ],
    'Exclamatory sentences (الجمل التعجبية) in Arabic are used to express strong emotions, surprise, or admiration. They often begin with the word "ما" (how/what) and end with an exclamation point.',
  ),

  ArabicGrammarTopic(
    'Causative Verbs (الأفعال السببية)',
    [
      Example('ساعد', 'to help'),
      Example('جعل', 'to make/cause'),
    ],
    'Causative verbs (الأفعال السببية) in Arabic are used to indicate that the subject causes someone else to perform an action. They are often formed by adding prefixes or modifying the verb root.',
  ),

  ArabicGrammarTopic(
    'Verbal Nouns as Subjects (استخدام الأسماء المصدرية كمواضيع)',
    [
      Example('القراءة مفيدة', 'Reading is beneficial'),
      Example('العمل هو المفتاح للنجاح', 'Work is the key to success'),
    ],
    'In Arabic, verbal nouns (الأسماء المصدرية) can be used as subjects of sentences. They often appear at the beginning of sentences followed by a verb.',
  ),

  ArabicGrammarTopic(
    'Conditional Sentences Type 4 (الجمل الشرطية من النوع الرابع)',
    [
      Example('إذا لم تكن قد درست، فلن تنجح',
          'If you haven\'t studied, you won\'t pass'),
      Example('لو مررت بالاختبار، لكنت قد اجتزت',
          'If you had passed the exam, you would have succeeded'),
    ],
    'Conditional sentences of the fourth type (الجمل الشرطية من النوع الرابع) in Arabic express unreal or hypothetical conditions in the present or future, often involving the use of "إذا" (if) and the past tense negation.',
  ),

  ArabicGrammarTopic(
    'Dual and Plural Forms of Adjectives (صيغ المثنى والجمع للصفات)',
    [
      Example('الكتب الجديدتان', 'The two new books'),
      Example('الأصدقاء السعداء', 'The happy friends'),
    ],
    'Adjectives in Arabic also have dual and plural forms to match the gender and number of the nouns they describe. They must agree in gender, number, and case with the nouns.',
  ),

  ArabicGrammarTopic(
    'Inanimate Gender (الجنس للأشياء غير الحية)',
    [
      Example('الكتاب ثقيل', 'The book is heavy (masculine)'),
      Example('القلم خفيف', 'The pen is light (masculine)'),
    ],
    'In Arabic, even inanimate objects have grammatical gender. Nouns related to inanimate objects are classified as either masculine or feminine, affecting the form of accompanying adjectives and verbs.',
  ),
  ArabicGrammarTopic(
    'Vocative Case (المنادى)',
    [
      Example('يا أستاذ!', 'Oh, professor!'),
      Example('يا أخي!', 'Oh, my brother!'),
    ],
    'The vocative case (المنادى) in Arabic is used when addressing someone directly. It often involves using "يا" (Oh) followed by the person s name or title.',
  ),

  ArabicGrammarTopic(
    'Conditional Sentences Type 5 (الجمل الشرطية من النوع الخامس)',
    [
      Example(
          'لو كان قد أتى، لرأيناه', 'If he had come, we would have seen him'),
      Example(
          'إذا كنت هناك، فسأكون سعيدًا', 'If you are there, I will be happy'),
    ],
    'Conditional sentences of the fifth type (الجمل الشرطية من النوع الخامس) in Arabic express unreal or hypothetical conditions in the past, present, or future. They often involve the use of "لو" (if) and the past perfect tense verb.',
  ),

  ArabicGrammarTopic(
    'Accusative Case (النصب)',
    [
      Example('رأيت الكتاب', 'I saw the book'),
      Example('قرأت المقالة', 'I read the article'),
    ],
    'The accusative case (النصب) in Arabic is used to indicate the direct object of a verb, showing what or whom the action is directed toward. Nouns in the accusative case often have a "ـا" ending.',
  ),

  ArabicGrammarTopic(
    'Jussive Mood (الوجه الآمري)',
    [
      Example('اقرأ الكتاب', 'Read the book'),
      Example('ليأكل الطفل', 'Let the child eat'),
    ],
    'The jussive mood (الوجه الآمري) in Arabic is used to express commands or requests. It often involves using the verb in the imperative form.',
  ),

  ArabicGrammarTopic(
    'Noun-Verb Agreement (اختلاف العدد بين الفعل والفاعل)',
    [
      Example('الأطفال يلعبون', 'The children are playing'),
      Example('الطالبة تقرأ', 'The female student is reading'),
    ],
    'In Arabic, there should be agreement in number (singular/plural) between the verb (the action) and the subject (the doer). If the subject is plural, the verb and other elements must reflect that in the sentence.',
  ),

  ArabicGrammarTopic(
    'Comparative Conjunction (حرف المقارنة)',
    [
      Example('أنا أذكى منك', 'I am smarter than you'),
      Example(
          'هذا الكتاب أفضل مما تعتقد', 'This book is better than you think'),
    ],
    'The comparative conjunction (حرف المقارنة) in Arabic is used to compare two things or actions. It often involves using words like "من" (than) to establish a comparison.',
  ),

  // Add more grammar topics with examples and explanations as needed
];

void loadGrammarData() {
  // Load more grammar topics and examples here
}
