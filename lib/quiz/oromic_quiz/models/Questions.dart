class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "How do you say 'Good Morning' in Afaan Oromo?",
    "options": [
      "Akkam Bulte",
      "Maa dhageetu",
      "Mootummaan",
      "Baga nagaan dhuftan"
    ],
    "answer_index": 0
  },
  {
    "id": 2,
    "question": "What is the Afaan Oromo word for 'food'?",
    "options": ["Gubaa", "Maccaa", "nyaata", "Ilmaan"],
    "answer_index": 2
  },
  {
    "id": 3,
    "question": "Translate 'Thank you' to Afaan Oromo.",
    "options": ["Rabbirraa", "Namoonni", "Dhugaa", "Galatoomi"],
    "answer_index": 3
  },
  {
    "id": 4,
    "question": "How do you say 'Goodbye' in Afaan Oromo?",
    "options": ["Nagatti", "Akkam jirtaa", "Mootummaan", "Isa kana"],
    "answer_index": 0
  },
  {
    "id": 5,
    "question": "What is the Afaan Oromo word for 'water'?",
    "options": ["Fudhadhaa", "Maani", "Dachee", "Bishaan"],
    "answer_index": 3
  },
  {
    "id": 6,
    "question": "What does 'Mootummaa' mean in Afaan Oromo?",
    "options": ["Food", "Government", "River", "Hello"],
    "answer_index": 1
  },
  {
    "id": 7,
    "question": "Translate 'I am fine' to Afaan Oromo.",
    "options": ["Akkam jirtaa", "Mootummaan", "Maa dhageetu", "Ani Nagaadha"],
    "answer_index": 3
  },
  {
    "id": 8,
    "question": "What is the Afaan Oromo word for 'sun'?",
    "options": ["Bilisummaa", "Qabsoo", "Dhugaa", "biftuu"],
    "answer_index": 3
  },
  {
    "id": 9,
    "question": "Translate 'Please' to Afaan Oromo.",
    "options": ["maaloo", "Rabbirraa", "Maani", "Gafarsa"],
    "answer_index": 0
  },
  {
    "id": 10,
    "question": "How do you say 'My name is...' in Afaan Oromo?",
    "options": ["Maqaan koo", "Akkam jirtaa", "Isa kana", "Fudhadhaa"],
    "answer_index": 0
  },
  {
    "id": 11,
    "question": "What is the Afaan Oromo word for 'family'?",
    "options": ["Walaloo", "Gubaa", "Maatii", "Namoonni"],
    "answer_index": 2
  },
  {
    "id": 12,
    "question": "Translate 'Small' to Afaan Oromo.",
    "options": ["Walaloo", "Xiqqoo", "bayyee", "furdaa"],
    "answer_index": 1
  },
  {
    "id": 13,
    "question": "How do you say 'Yes' in Afaan Oromo?",
    "options": ["Eyyee", "Lakki", "Bilisummaa", "Hundumtuu"],
    "answer_index": 0
  },
  {
    "id": 14,
    "question": "What is the Afaan Oromo word for 'money'?",
    "options": ["deemuu", "warqii", "Fudhadhaa", "Mallaqa"],
    "answer_index": 3
  },
  {
    "id": 15,
    "question": "Translate 'face' to Afaan Oromo.",
    "options": ["Harka", "fuula", "morma", "ija"],
    "answer_index": 1
  },
  {
    "id": 16,
    "question": "What is the Afaan Oromo word for 'friend'?",
    "options": ["Akkam jirtaa", "Dachee", "soddaa", "Hiriyaa"],
    "answer_index": 3
  },
  {
    "id": 17,
    "question": "Translate 'happy' to Afaan Oromo.",
    "options": ["Nasuu", "gammachuu", "Namoonni", "Dhugaa"],
    "answer_index": 1
  },
  {
    "id": 18,
    "question": "How do you say 'What is your name?' in Afaan Oromo?",
    "options": [
      "Maani akka dhuftan?",
      "Karaa ka jedhu?",
      "Jaldeesa maali?",
      "Maqaan kee enyuu?"
    ],
    "answer_index": 3
  },
  {
    "id": 19,
    "question": "What is the Afaan Oromo word for 'book'?",
    "options": ["barnoota", "Akkam jirtaa", "qalama", "kitaba"],
    "answer_index": 3
  },
  {
    "id": 20,
    "question": "Translate 'tomorrow' to Afaan Oromo.",
    "options": ["kalessa", "iftaan", "bor", "Hundumtuu"],
    "answer_index": 2
  },
  {
    "id": 21,
    "question": "What is the Afaan Oromo word for 'tree'?",
    "options": ["Ilmaan", "farda", "demuu", "muka"],
    "answer_index": 3
  },
  {
    "id": 22,
    "question": "Translate 'month' to Afaan Oromo.",
    "options": ["torbee", "Gubaa", "jia", "waggaa"],
    "answer_index": 2
  },
  {
    "id": 23,
    "question": "How do you say 'week' in Afaan Oromo?",
    "options": ["lama", "jia", "torbee", "waggaa"],
    "answer_index": 2
  },
  {
    "id": 24,
    "question": "What is the Afaan Oromo word for 'earth'?",
    "options": ["Magaalaa", "Karaa", "Moggaasa", "Lafa"],
    "answer_index": 3
  },
  {
    "id": 25,
    "question": "Translate 'I love you' to Afaan Oromo.",
    "options": ["Namoonni", "sinjalladha", "Bilisummaa", "Dhugaa"],
    "answer_index": 1
  },
  {
    "id": 26,
    "question": "What is the Afaan Oromo word for 'eye'?",
    "options": ["fuula", "kalee", "morma", "ija"],
    "answer_index": 3
  },
  {
    "id": 27,
    "question": "Translate 'male' to Afaan Oromo.",
    "options": ["durba", "jarsa", "dhiira", "jarti"],
    "answer_index": 2
  },
  {
    "id": 28,
    "question": "How do you say 'how are you' in Afaan Oromo?",
    "options": [
      "Baga nagaan dhuftan",
      "kalessa",
      "Akkam jirtaa",
      "akkam bulte"
    ],
    "answer_index": 2
  },
  {
    "id": 29,
    "question": "What is the Afaan Oromo word for 'mountain'?",
    "options": ["tabba", "Namoota keenya", "Fuudhadhaa", "Karaa"],
    "answer_index": 0
  },
  {
    "id": 30,
    "question": "Translate 'beautiful' to Afaan Oromo.",
    "options": ["Macaan", "bareedaa", "fokisaa", "nama"],
    "answer_index": 1
  },
  {
    "id": 31,
    "question": "What is the Afaan Oromo word for 'friday'?",
    "options": ["roobii", "kibtata", "dilbata", "jimata"],
    "answer_index": 3
  },
  {
    "id": 32,
    "question": "Translate 'night' to Afaan Oromo.",
    "options": ["guyya", "halkan", "Maani", "Gubaa"],
    "answer_index": 1
  },
  {
    "id": 33,
    "question": "How do you say 'help' in Afaan Oromo?",
    "options": [
      "Baga nagaan dhuftan",
      "Akkam jirtaa",
      "Fuudhadhaa",
      "gargarsa"
    ],
    "answer_index": 3
  },
  {
    "id": 34,
    "question": "What is the Afaan Oromo word for 'tree'?",
    "options": ["Lafa", "Magaalaa", "Gurguddoo", "muka"],
    "answer_index": 3
  },
  {
    "id": 35,
    "question": "Translate 'ten' to Afaan Oromo.",
    "options": ["shan", "Bilisummaa", "kudhan", "digdama"],
    "answer_index": 2
  },
  {
    "id": 36,
    "question": "How do you say 'freedom' in Afaan Oromo?",
    "options": ["Dachee", "Namoota keenya", "Biyyaa", "Bilisummaa"],
    "answer_index": 2
  },
  {
    "id": 37,
    "question": "Translate 'city' to Afaan Oromo.",
    "options": ["Lafa", "Walaloo", "Magaalaa", "Maani"],
    "answer_index": 1
  },
  {
    "id": 38,
    "question": "What is the Afaan Oromo word for 'new'?",
    "options": ["Haaraa", "Fuudhadhaa", "Bilisummaa", "Kuusaa"],
    "answer_index": 0
  },
  {
    "id": 39,
    "question": "Translate 'child' to Afaan Oromo.",
    "options": ["Garaaf", "Gurguddoo", "Macaa", "Baga nagaan dhuftan"],
    "answer_index": 2
  },
  {
    "id": 40,
    "question": "How do you say 'school' in Afaan Oromo?",
    "options": ["Gammachuu", "Bilisummaa", "mana barumsa", "Fuudhadhaa"],
    "answer_index": 2
  },
  {
    "id": 41,
    "question": "What is the Afaan Oromo word for 'five'?",
    "options": ["shan", "lama", "tokko", "afur"],
    "answer_index": 0
  },
  {
    "id": 42,
    "question": "Translate 'morning' to Afaan Oromo.",
    "options": ["galgala", "Waqaa", "Ganama", "Hiriyyaa"],
    "answer_index": 2
  },
  {
    "id": 43,
    "question": "How do you say 'son' in Afaan Oromo?",
    "options": ["Akkam jirtaa", "Walaloo", "Ilmaan", "Gurguddoo"],
    "answer_index": 2
  },
  {
    "id": 44,
    "question": "What is the Afaan Oromo word for 'walk'?",
    "options": ["Gabbisaa", "Maani", "Baga nagaan dhuftan", "deemuu"],
    "answer_index": 3
  },
  {
    "id": 45,
    "question": "Translate 'music' to Afaan Oromo.",
    "options": ["Macaan", "Garaaf", "Hiriyyaa", "muziqaa"],
    "answer_index": 3
  },
  {
    "id": 46,
    "question": "How do you say 'you' in Afaan Oromo?",
    "options": ["ati/isin", "jera", "Gurguddoo", "isheen"],
    "answer_index": 0
  },
  {
    "id": 47,
    "question": "Translate 'news' to Afaan Oromo.",
    "options": ["haraa", "moofaa", "duwwa", "oduu"],
    "answer_index": 3
  },
  {
    "id": 48,
    "question": "How do you say 'poem' in Afaan Oromo?",
    "options": ["Walaloo", "Isa kana", "Hiriyyaa", "Gabbisaa"],
    "answer_index": 0
  },
  {
    "id": 49,
    "question": "What is the Afaan Oromo word for 'tree'?",
    "options": ["Macaan", "muka", "Kitaba", "Fuudhadhaa"],
    "answer_index": 1
  },
  {
    "id": 50,
    "question": "Translate 'rain' to Afaan Oromo.",
    "options": ["aduu", "dumessa", "jia", "bokka"],
    "answer_index": 3
  },
];
