class EnglishGrammarLesson {
  final String title;
  final String description;

  EnglishGrammarLesson({
    this.title,
    this.description,
  });
}

List<EnglishGrammarLesson> getGrammarLessons() {
  return [
    EnglishGrammarLesson(
      title: 'Nouns',
      description: 'Learn about nouns in English grammar.',
    ),
    EnglishGrammarLesson(
      title: 'Verbs',
      description: 'Explore different verb tenses and forms.',
    ),
    EnglishGrammarLesson(
      title: 'Adjectives',
      description: 'Study adjectives and their usage.',
    ),
    EnglishGrammarLesson(
      title: 'Prepositions',
      description: 'Understand the role of prepositions.',
    ),
    // Add more grammar lessons here
  ];
}
