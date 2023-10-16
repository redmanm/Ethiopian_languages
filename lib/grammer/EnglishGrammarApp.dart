import 'package:flutter/material.dart';

class EnglishGrammarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EnglishGrammarScreen(),
    );
  }
}

class EnglishGrammarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Grammar'),
      ),
      body: EnglishGrammarList(),
    );
  }
}

class EnglishGrammarList extends StatefulWidget {
  @override
  _EnglishGrammarListState createState() => _EnglishGrammarListState();
}

class _EnglishGrammarListState extends State<EnglishGrammarList> {
  TextEditingController searchController = TextEditingController();
  List<EnglishGrammarTopic> filteredTopics = List.of(englishGrammarTopics);

  @override
  void initState() {
    super.initState();
    searchController.addListener(filterTopics);
  }

  void filterTopics() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredTopics = englishGrammarTopics
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
                          EnglishGrammarDetailScreen(topic: topic),
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

class EnglishGrammarDetailScreen extends StatelessWidget {
  final EnglishGrammarTopic topic;

  EnglishGrammarDetailScreen({this.topic});

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

class EnglishGrammarTopic {
  final String title;
  final List<Example> examples;
  final String explanation;

  EnglishGrammarTopic(this.title, this.examples, this.explanation);
}

class Example {
  final String example;

  Example(this.example);
}

List<EnglishGrammarTopic> englishGrammarTopics = [
  EnglishGrammarTopic(
    'Nouns',
    [
      Example('A dog barks.'),
      Example('The sun shines.'),
      Example('She is a talented singer.'),
      Example('The old house needs repairs.'),
      Example('They found treasure in the cave.'),
    ],
    'In English, nouns are used to name people, places, things, or ideas. '
        'They can be singular or plural and play a crucial role in constructing sentences.',
  ),
  EnglishGrammarTopic(
    'Verbs',
    [
      Example('She is reading a book.'),
      Example('They were playing in the park.'),
      Example('He will visit his grandmother tomorrow.'),
      Example('The chef prepared a delicious meal.'),
      Example('The river flows gently.'),
    ],
    'Verbs in English indicate actions or states of being. '
        'They are conjugated based on tense, person, number, and gender and are vital for sentence formation.',
  ),
  EnglishGrammarTopic(
    'Adjectives',
    [
      Example('Its a beautiful day.'),
      Example('The red car is fast.'),
      Example('She wore a stunning dress to the party.'),
      Example('The tall tree provided shade on a hot day.'),
      Example('The cozy blanket kept them warm during the winter night.'),
    ],
    'Adjectives in English describe nouns and provide additional information about them. '
        'They enhance sentence descriptions and add details to nouns.',
  ),
  EnglishGrammarTopic(
    'Adverbs',
    [
      Example('She runs quickly.'),
      Example('He speaks very loudly.'),
      Example('They arrived late for the meeting.'),
      Example('She sings beautifully.'),
      Example('He always helps others.'),
    ],
    'Adverbs modify verbs, adjectives, or other adverbs. They describe how an action is performed or provide additional information about intensity, frequency, or manner.',
  ),
  EnglishGrammarTopic(
    'Prepositions',
    [
      Example('The cat is under the table.'),
      Example('She walked across the bridge.'),
      Example('He placed the book on the shelf.'),
      Example('The keys are inside the drawer.'),
      Example('She drove through the tunnel.'),
    ],
    'Prepositions show relationships between nouns or pronouns and other words in a sentence. They indicate location, direction, time, and more.',
  ),

  EnglishGrammarTopic(
    'Conjunctions',
    [
      Example('I like both pizza and pasta.'),
      Example('He neither called nor texted me.'),
      Example('She can swim, but she can\'t dive.'),
      Example('They arrived early, so they got good seats.'),
      Example('I want either the red shirt or the blue one.'),
    ],
    'Conjunctions are words that connect words, phrases, or clauses in a sentence. They are used to join ideas, show contrast, and indicate relationships between elements.',
  ),
  EnglishGrammarTopic(
    'Articles',
    [
      Example('An apple is on the table.'),
      Example('The sun is shining.'),
      Example('A cat is a common pet.'),
      Example('She found an interesting book.'),
      Example('The dog barked loudly.'),
    ],
    'Articles are words like "a," "an," and "the" that are used before nouns to specify whether the noun is general or specific. "A" and "an" are indefinite articles, while "the" is the definite article.',
  ),
  EnglishGrammarTopic(
    'Pronouns',
    [
      Example('She is my friend. She is very kind.'),
      Example('They will arrive soon. I will meet them.'),
      Example('He is reading his favorite book.'),
      Example('It is raining outside. It has been raining all day.'),
      Example('We watched a movie. It was entertaining.'),
    ],
    'Pronouns are words that replace nouns in a sentence to avoid repetition. Common pronouns include "he," "she," "it," "they," "we," "you," and "I."',
  ),
  EnglishGrammarTopic(
    'Direct and Indirect Objects',
    [
      Example('She gave him a gift.'),
      Example('I sent her a message.'),
      Example('They bought us dinner.'),
      Example('He showed them the way.'),
      Example('She wrote me a letter.'),
    ],
    'In a sentence, the direct object is the recipient of the action, while the indirect object receives the direct object. They provide additional information about the action of the verb.',
  ),

  EnglishGrammarTopic(
    'Conditional Sentences',
    [
      Example('If it rains, I will stay home.'),
      Example('She would travel if she had more time.'),
      Example('If you study hard, you will pass the exam.'),
      Example('He will call you if he gets the chance.'),
      Example('I would have gone if I had known.'),
    ],
    'Conditional sentences express a condition and its result. They often use words like "if," "unless," "provided that," and "in case" to describe hypothetical situations and their outcomes.',
  ),
  EnglishGrammarTopic(
    'Gerunds and Infinitives',
    [
      Example('I enjoy swimming in the pool.'),
      Example('She decided to study abroad.'),
      Example('He prefers playing soccer to watching TV.'),
      Example('I stopped to catch my breath.'),
      Example('She started singing in the shower.'),
    ],
    'Gerunds are verb forms ending in "-ing" that function as nouns. Infinitives are the base form of a verb (e.g., "to swim") and can function as nouns, adjectives, or adverbs in a sentence.',
  ),
  EnglishGrammarTopic(
    'Passive Voice',
    [
      Example('The book was read by her.'),
      Example('The cake was eaten by them.'),
      Example('The report will be submitted tomorrow.'),
      Example('The painting has been admired by many.'),
      Example('The news was delivered to us.'),
    ],
    'The passive voice is used when the focus is on the action or the result, rather than the doer of the action. It often employs variations of "to be" and the past participle of the verb.',
  ),
  EnglishGrammarTopic(
    'Direct Speech and Reported Speech',
    [
      Example('She said, "I will come tomorrow."'),
      Example('He asked, "Have you finished your homework?"'),
      Example('She told me that she was leaving.'),
      Example('He said that he had already eaten.'),
      Example('They asked if we could join them.'),
    ],
    'Direct speech represents the exact words spoken by a person, enclosed in quotation marks. Reported speech (indirect speech) conveys the speaker\'s words indirectly, often with changes in verb tenses and pronouns.',
  ),
  EnglishGrammarTopic(
    'Comparatives and Superlatives',
    [
      Example('She is taller than her sister.'),
      Example('This book is more interesting than the last one.'),
      Example('He is the fastest runner on the team.'),
      Example('The Eiffel Tower is the most famous landmark in Paris.'),
      Example('The exam was easier than we expected.'),
    ],
    'Comparatives are used to compare two or more things, indicating which is superior, inferior, or equal. Superlatives express the highest degree of a quality or attribute among a group.',
  ),

  EnglishGrammarTopic(
    'Phrasal Verbs',
    [
      Example('She always puts off doing her homework.'),
      Example('He broke up with his girlfriend last week.'),
      Example('They need to look after their younger siblings.'),
      Example('I ran into an old friend at the supermarket.'),
      Example('We should get together for coffee sometime.'),
    ],
    'Phrasal verbs are combinations of verbs and one or more particles, such as prepositions or adverbs. They often have meanings that are different from the individual words. Phrasal verbs are common in English.',
  ),
  EnglishGrammarTopic(
    'Relative Clauses',
    [
      Example('The book that she recommended is excellent.'),
      Example('The person who won the award is my cousin.'),
      Example('The house where I grew up is for sale.'),
      Example('The movie, which was released last month, is a must-see.'),
      Example('The car that he bought is very expensive.'),
    ],
    'Relative clauses are used to provide additional information about a noun. They begin with words like "who," "which," or "that" and help to identify or describe the noun in more detail.',
  ),
  EnglishGrammarTopic(
    'Modal Verbs',
    [
      Example('She can swim very well.'),
      Example('You should eat more vegetables.'),
      Example('He must finish the assignment by tomorrow.'),
      Example('They might attend the party later.'),
      Example('We could go for a walk in the evening.'),
    ],
    'Modal verbs (such as can, could, should, must, might) are used to express necessity, possibility, ability, permission, or obligation. They are often used in combination with other verbs.',
  ),
  EnglishGrammarTopic(
    'Indirect Questions',
    [
      Example('He asked if she could help him.'),
      Example('She wondered where they had gone.'),
      Example('They inquired whether the store was open.'),
      Example('I don\'t know when she will arrive.'),
      Example('He wanted to find out what time the meeting was.'),
    ],
    'Indirect questions are used to report or ask about information indirectly rather than in a direct question format. They are often introduced by phrases like "I wonder," "I don\'t know," or "He asked if."',
  ),
  EnglishGrammarTopic(
    'Countable and Uncountable Nouns',
    [
      Example('I have three books on my shelf.'),
      Example('She bought some milk at the store.'),
      Example('They have two cats and a dog.'),
      Example('He needs some advice on the matter.'),
      Example('We have a lot of homework to do.'),
    ],
    'Countable nouns refer to things that can be counted individually, while uncountable nouns represent things that cannot be counted individually. Understanding the distinction is important for using articles and quantifiers correctly.',
  ),

  EnglishGrammarTopic(
    'Conditional Perfect Tense',
    [
      Example('If he had studied harder, he would have passed the exam.'),
      Example('She would have gone to the party if she had been invited.'),
      Example('If they had arrived on time, they would have caught the train.'),
      Example('I would have helped you if I had known you needed it.'),
      Example('If it had rained, the event would have been canceled.'),
    ],
    'The conditional perfect tense is used to express hypothetical situations that could have happened in the past but did not. It is formed by using "would have" or "could have" followed by the past participle of the verb.',
  ),
  EnglishGrammarTopic(
    'Ellipsis',
    [
      Example('She can play the guitar; he, the piano.'),
      Example('She likes pizza; he, hamburgers.'),
      Example('He enjoys hiking; she, swimming.'),
      Example('I prefer tea; they, coffee.'),
      Example('They are from New York; we, from Chicago.'),
    ],
    'Ellipsis is the omission of words or phrases that can be understood from the context. It is used to avoid redundancy or repetition in sentences.',
  ),
  EnglishGrammarTopic(
    'Defining and Non-defining Relative Clauses',
    [
      Example('The book that is on the shelf is mine.'),
      Example('My friend, who lives in Paris, visited me.'),
      Example('The car which he drives is very expensive.'),
      Example('My sister, who is a doctor, lives in London.'),
      Example('The movie that we watched last night was excellent.'),
    ],
    'Defining relative clauses provide essential information about a noun, while non-defining relative clauses provide additional, non-essential information. Non-defining clauses are set off by commas.',
  ),
  EnglishGrammarTopic(
    'Exclamatory Sentences',
    [
      Example('What a beautiful sunset!'),
      Example('How delicious this cake is!'),
      Example('What an exciting game that was!'),
      Example('How kind of you to help!'),
      Example('What a surprise to see you here!'),
    ],
    'Exclamatory sentences are used to express strong emotions, surprise, or admiration. They often begin with "What" or "How" and end with an exclamation mark.',
  ),
  EnglishGrammarTopic(
    'Quantifiers',
    [
      Example('There is a little milk in the fridge.'),
      Example('She has plenty of time to finish the task.'),
      Example('He has too many books on his shelf.'),
      Example('I need a few more ingredients for the recipe.'),
      Example('They have a lot of work to do before the deadline.'),
    ],
    'Quantifiers are words used to express the quantity or amount of something. Common quantifiers include "a little," "a few," "many," "much," "plenty of," and "too many."',
  ),
  EnglishGrammarTopic(
    'Participles',
    [
      Example('The broken window needs to be fixed.'),
      Example('He looked at the fallen tree.'),
      Example('The excited children played in the park.'),
      Example('Having finished her work, she went home.'),
      Example('The stolen bike was recovered by the police.'),
    ],
    'Participles are verb forms that function as adjectives. There are two types: present participles (ending in -ing) and past participles (often ending in -ed, -en, or irregular forms).',
  ),
  EnglishGrammarTopic(
    'Gerund vs. Infinitive',
    [
      Example('She enjoys swimming in the pool.'),
      Example('She decided to swim in the pool.'),
      Example('I like playing the guitar.'),
      Example('I like to play the guitar.'),
      Example('He stopped talking to me.'),
    ],
    'Gerunds (verb + -ing) and infinitives (to + base verb) can both be used as subjects, objects, or complements in sentences, but their usage can vary depending on the verb that precedes them.',
  ),
  EnglishGrammarTopic(
    'Causative Verbs',
    [
      Example('I had my car washed yesterday.'),
      Example('She made him do the dishes.'),
      Example('They had their house painted last summer.'),
      Example('He let his friend borrow his laptop.'),
      Example('She got her hair cut at the salon.'),
    ],
    'Causative verbs are used to express that someone causes or arranges for another person to do something. Common causative verbs include "have," "make," "let," and "get."',
  ),
  EnglishGrammarTopic(
    'Double Negatives',
    [
      Example('I don\'t have none left.'),
      Example('She didn\'t eat nothing all day.'),
      Example('He can\'t find his keys nowhere.'),
      Example('We ain\'t going nowhere.'),
      Example('They won\'t never give up.'),
    ],
    'Double negatives involve the use of two negative elements in a sentence, which can result in negation being intensified or neutralized. In standard English, double negatives are considered non-standard.',
  ),
  EnglishGrammarTopic(
    'Mixed Conditionals',
    [
      Example('If I had known, I would have told you.'),
      Example('If she were here now, she would help us.'),
      Example('He wouldn\'t be late if he had set an alarm.'),
      Example('If they had practiced more, they would be better.'),
      Example('If it rains tomorrow, I will stay in.'),
    ],
    'Mixed conditionals combine elements of different conditional tenses within the same sentence. They are used to express hypothetical situations that span both past and present or present and future.',
  ),
  EnglishGrammarTopic(
    'Reported Commands',
    [
      Example('She told me to sit down.'),
      Example('He instructed us not to touch anything.'),
      Example('The teacher ordered them to be quiet.'),
      Example('She advised him to study for the test.'),
      Example('I asked her not to call me late at night.'),
    ],
    'Reported commands are used to convey instructions or orders given by someone else. They are usually introduced with verbs like "tell," "instruct," "order," or "advise," followed by an infinitive verb.',
  ),
  EnglishGrammarTopic(
    'Mixed Verbs',
    [
      Example('I have been working here for three years.'),
      Example('She had already left when I arrived.'),
      Example('By next year, he will have traveled to five countries.'),
      Example('They would be playing tennis now if it weren\'t raining.'),
      Example('I may have forgotten to lock the door.'),
    ],
    'Mixed verbs involve the use of various verb tenses in a single sentence to express complex time relationships. They often indicate actions that began in the past and continue into the present or future.',
  ),
  EnglishGrammarTopic(
    'Parallel Structure',
    [
      Example('She likes to swim, to bike, and to run.'),
      Example('He enjoys reading, painting, and playing the piano.'),
      Example('We can either go to the beach or visit the museum.'),
      Example('The project involves planning, designing, and executing.'),
      Example('To succeed, you need dedication, hard work, and perseverance.'),
    ],
    'Parallel structure (parallelism) is the use of consistent grammatical structure in a list or series of words, phrases, or clauses. It enhances clarity and balance in writing and speaking.',
  ),
  EnglishGrammarTopic(
    'Direct and Reported Speech in Questions',
    [
      Example('She asked, "Have you finished your homework?"'),
      Example('He inquired, "What time does the movie start?"'),
      Example('She wondered, "Is he coming to the party?"'),
      Example('They asked, "Can you help us with this?"'),
      Example('I don\'t know, "Where did they go after dinner?"'),
    ],
    'In reported speech, questions often become statements. The reporting verb may change, and the word order might be different from direct speech questions. The use of question words like "who," "what," "where," etc., may vary.',
  ),
  EnglishGrammarTopic(
    'Idioms and Colloquial Expressions',
    [
      Example('He spilled the beans about the surprise party.'),
      Example('She is feeling under the weather today.'),
      Example('They hit the jackpot with their new business idea.'),
      Example('I cant believe he let the cat out of the bag.'),
      Example('She is in the doghouse for forgetting their anniversary.'),
    ],
    'Idioms and colloquial expressions are phrases or sayings that have a figurative meaning different from the literal interpretation of their individual words. They are often used in informal language and can be challenging for non-native speakers to understand.',
  ),
  EnglishGrammarTopic(
    'Reflexive Pronouns',
    [
      Example('She washed herself before going to bed.'),
      Example('He congratulated himself on the achievement.'),
      Example('They enjoyed themselves at the party.'),
      Example('I need to remind myself to buy groceries.'),
      Example('We often talk to ourselves when we are alone.'),
    ],
    'Reflexive pronouns are used when the subject and the object of a sentence are the same person or thing. They end in -self (singular) or -selves (plural).',
  ),
  EnglishGrammarTopic(
    'Phonetics and Pronunciation',
    [
      Example('The "th" sound in "think" is pronounced as /θ/.'),
      Example(
          'In American English, "schedule" is often pronounced as /ˈskɛdʒuːl/.'),
      Example('She pronounced "mischievous" as /ˈmɪs.tʃɪ.vəs/.'),
      Example('The vowel sound in "cot" is different from that in "caught."'),
      Example('Many English accents drop the "r" sound at the end of words.'),
    ],
    'Phonetics is the study of speech sounds, while pronunciation refers to the way words are spoken. English pronunciation can vary widely depending on regional accents and dialects.',
  ),
  EnglishGrammarTopic(
    'Expletive Sentences',
    [
      Example('There is a cat in the garden.'),
      Example('It seems that she will arrive late.'),
      Example('There were many people at the concert.'),
      Example('It appears that they have already left.'),
      Example('There seems to be a misunderstanding.'),
    ],
    'Expletive sentences use the pronouns "there" or "it" at the beginning of a sentence to introduce the subject, especially when the true subject follows the verb. They are commonly used in English for emphasis or clarity.',
  ),
  EnglishGrammarTopic(
    'Redundancy and Wordiness',
    [
      Example('He added extra bonus points.'),
      Example('She repeated the same thing again.'),
      Example('They collaborated together on the project.'),
      Example('It is a true fact that he will attend the meeting.'),
      Example('She has a total of twelve different varieties of shoes.'),
    ],
    'Redundancy and wordiness occur when unnecessary words or phrases are used in a sentence, making it longer or less clear. Effective writing and communication often require concise and precise language.',
  ),
  EnglishGrammarTopic(
    'Hyphenation Rules',
    [
      Example('This is a one-way street.'),
      Example('She is a well-known author.'),
      Example('The four-year-old child is very active.'),
      Example('The decision was last-minute.'),
      Example('He has a can-do attitude.'),
    ],
    'Hyphens are used to connect words in various situations, such as compound nouns, compound adjectives, and numbers. Understanding hyphenation rules helps ensure correct word usage.',
  ),
  // Continue adding more topics and examples as needed to reach your desired total

  // ... (additional topics and examples)
  // Continue adding more topics and examples as needed to reach your desired total

  // ... (additional topics and examples)
  // Add more topics with examples and explanations as needed
];
