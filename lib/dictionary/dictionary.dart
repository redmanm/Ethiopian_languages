import 'package:flutter/material.dart';

class MultiLanguageDictionaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiLanguageDictionaryScreen(),
    );
  }
}

class MultiLanguageDictionaryScreen extends StatefulWidget {
  @override
  _MultiLanguageDictionaryScreenState createState() =>
      _MultiLanguageDictionaryScreenState();
}

class _MultiLanguageDictionaryScreenState
    extends State<MultiLanguageDictionaryScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String searchText = '';

  // Sample dictionary data (English, Arabic, Amharic, Afaan Oromo)
  Map<String, Map<String, String>> dictionary = {
    'apple': {
      'english': 'apple',
      'arabic': 'تفاحة',
      'amharic': 'አፕል',
      'afaan_oromo': 'siyaadaa',
    },
    'airplane': {
      'english': 'airplane',
      'arabic': 'طائرة',
      'amharic': 'አቤል',
      'afaan_oromo': 'faayiloo',
    },
    'animal': {
      'english': 'animal',
      'arabic': 'حيوان',
      'amharic': 'እንስሳ',
      'afaan_oromo': 'ittii',
    },
    'apartment': {
      'english': 'apartment',
      'arabic': 'شقة',
      'amharic': 'ቤት',
      'afaan_oromo': 'boodaa',
    },
    'art': {
      'english': 'art',
      'arabic': 'فن',
      'amharic': 'ቤት',
      'afaan_oromo': 'qeerroo',
    },
    'arrow': {
      'english': 'arrow',
      'arabic': 'سهم',
      'amharic': 'ማዕረግ',
      'afaan_oromo': 'keessaa',
    },
    'attack': {
      'english': 'attack',
      'arabic': 'هجوم',
      'amharic': 'ተዋናይ',
      'afaan_oromo': 'foqoo',
    },
    'apple': {
      'english': 'apple',
      'arabic': 'تفاحة',
      'amharic': 'አፕል',
      'afaan_oromo': 'siyaadaa',
    },
    'amazing': {
      'english': 'amazing',
      'arabic': 'رائع',
      'amharic': 'ተነሳሽ',
      'afaan_oromo': 'mirga',
    },
    'argument': {
      'english': 'argument',
      'arabic': 'مناقشة',
      'amharic': 'ውሳኔ',
      'afaan_oromo': 'itti-fufaa',
    },
    'adventure': {
      'english': 'adventure',
      'arabic': 'مغامرة',
      'amharic': 'ሰለሞን',
      'afaan_oromo': 'dudda',
    },
    'accident': {
      'english': 'accident',
      'arabic': 'حادث',
      'amharic': 'ጥብስ',
      'afaan_oromo': 'kolfe',
    },
    'ambulance': {
      'english': 'ambulance',
      'arabic': 'إسعاف',
      'amharic': 'አምባሳደር',
      'afaan_oromo': 'kaasu',
    },
    'attractive': {
      'english': 'attractive',
      'arabic': 'جذاب',
      'amharic': 'አስር',
      'afaan_oromo': 'fiican',
    },
    'argument': {
      'english': 'argument',
      'arabic': 'مناقشة',
      'amharic': 'ውሳኔ',
      'afaan_oromo': 'itti-fufaa',
    },
    'address': {
      'english': 'address',
      'arabic': 'عنوان',
      'amharic': 'አድራሻ',
      'afaan_oromo': 'dheera',
    },
    'appearance': {
      'english': 'appearance',
      'arabic': 'مظهر',
      'amharic': 'ግብዣ',
      'afaan_oromo': 'namni',
    },
    'anger': {
      'english': 'anger',
      'arabic': 'غضب',
      'amharic': 'አይሁድ',
      'afaan_oromo': 'sirna',
    },
    'acquaintance': {
      'english': 'acquaintance',
      'arabic': 'معرفة',
      'amharic': 'ባለቤት',
      'afaan_oromo': 'hundumtu',
    },
    'attention': {
      'english': 'attention',
      'arabic': 'انتباه',
      'amharic': 'ማጣረር',
      'afaan_oromo': 'biroo',
    },
    'advice': {
      'english': 'advice',
      'arabic': 'نصيحة',
      'amharic': 'ማስታወሻ',
      'afaan_oromo': 'hagaya',
    },
    'area': {
      'english': 'area',
      'arabic': 'منطقة',
      'amharic': 'ዝርዝር',
      'afaan_oromo': 'qabeenya',
    },
    'arrive': {
      'english': 'arrive',
      'arabic': 'وصول',
      'amharic': 'መልስ',
      'afaan_oromo': 'bilisummaa',
    },
    'artistic': {
      'english': 'artistic',
      'arabic': 'فني',
      'amharic': 'ብስኩም',
      'afaan_oromo': 'keessummaa',
    },
    'authority': {
      'english': 'authority',
      'arabic': 'سلطة',
      'amharic': 'ተቀባይ',
      'afaan_oromo': 'gaafa',
    },
    'apologize': {
      'english': 'apologize',
      'arabic': 'اعتذر',
      'amharic': 'በስተቀር',
      'afaan_oromo': 'dhiisi',
    },
    'adventure': {
      'english': 'adventure',
      'arabic': 'مغامرة',
      'amharic': 'ሰለሞን',
      'afaan_oromo': 'dudda',
    },
    'achieve': {
      'english': 'achieve',
      'arabic': 'تحقيق',
      'amharic': 'ማድረግ',
      'afaan_oromo': 'itti-fufa',
    },
    'appreciate': {
      'english': 'appreciate',
      'arabic': 'تقدير',
      'amharic': 'ተረጋገመ',
      'afaan_oromo': 're’usuu',
    },
    'approach': {
      'english': 'approach',
      'arabic': 'اقتراب',
      'amharic': 'መቀመጫ',
      'afaan_oromo': 'atti',
    },
    'arrangement': {
      'english': 'arrangement',
      'arabic': 'ترتيب',
      'amharic': 'ተስማማቂ',
      'afaan_oromo': 'qabeenya',
    },
    'annual': {
      'english': 'annual',
      'arabic': 'سنوي',
      'amharic': 'ዘመን',
      'afaan_oromo': 'bishaanii',
    },
    'argument': {
      'english': 'argument',
      'arabic': 'مناقشة',
      'amharic': 'ውሳኔ',
      'afaan_oromo': 'itti-fufaa',
    },
    'assistant': {
      'english': 'assistant',
      'arabic': 'مساعد',
      'amharic': 'ተጠቃሚ',
      'afaan_oromo': 'maasuudha',
    },
    'actor': {
      'english': 'actor',
      'arabic': 'ممثل',
      'amharic': 'ሰማይ',
      'afaan_oromo': 'afeerraa',
    },
    'approve': {
      'english': 'approve',
      'arabic': 'يوافق',
      'amharic': 'አቀባበል',
      'afaan_oromo': 'o’uudhaan',
    },
    'agreement': {
      'english': 'agreement',
      'arabic': 'اتفاق',
      'amharic': 'መስማት',
      'afaan_oromo': 'ittiqa',
    },
    'arrival': {
      'english': 'arrival',
      'arabic': 'وصول',
      'amharic': 'መልስ',
      'afaan_oromo': 'bira',
    },
    'atmosphere': {
      'english': 'atmosphere',
      'arabic': 'جو',
      'amharic': 'ምስራቅ',
      'afaan_oromo': 'hoji',
    },
    'active': {
      'english': 'active',
      'arabic': 'نشيط',
      'amharic': 'ቀጣይ',
      'afaan_oromo': 'jireenya',
    },
    'agriculture': {
      'english': 'agriculture',
      'arabic': 'زراعة',
      'amharic': 'ለቅሶ',
      'afaan_oromo': 'qonnaan bultii',
    },
    'address': {
      'english': 'address',
      'arabic': 'عنوان',
      'amharic': 'አድራሻ',
      'afaan_oromo': 'dheera',
    },
    'arrive': {
      'english': 'arrive',
      'arabic': 'وصول',
      'amharic': 'መልስ',
      'afaan_oromo': 'bilisummaa',
    },
    'appreciation': {
      'english': 'appreciation',
      'arabic': 'تقدير',
      'amharic': 'ተረጋገመ',
      'afaan_oromo': 're’usuu',
    },
    'award': {
      'english': 'award',
      'arabic': 'جائزة',
      'amharic': 'ቀላል',
      'afaan_oromo': 'daldala',
    },
    'average': {
      'english': 'average',
      'arabic': 'متوسط',
      'amharic': 'መቆያ',
      'afaan_oromo': 'middhaa',
    },
    'avoid': {
      'english': 'avoid',
      'arabic': 'تجنب',
      'amharic': 'ቀንድ',
      'afaan_oromo': 'baasisuu',
    },
    'affection': {
      'english': 'affection',
      'arabic': 'مودة',
      'amharic': 'ፍቅር',
      'afaan_oromo': 'sirriina',
    },
    'argument': {
      'english': 'argument',
      'arabic': 'مناقشة',
      'amharic': 'ውሳኔ',
      'afaan_oromo': 'itti-fufaa',
    },
    'activity': {
      'english': 'activity',
      'arabic': 'نشاط',
      'amharic': 'ቀጣይ',
      'afaan_oromo': 'jalaa',
    },
    'accommodation': {
      'english': 'accommodation',
      'arabic': 'إقامة',
      'amharic': 'እንስሳዊ መንገድ',
      'afaan_oromo': 'qorannoo namaa',
    },
    'automatic': {
      'english': 'automatic',
      'arabic': 'آلي',
      'amharic': 'ሞተረ',
      'afaan_oromo': 'liqimsaa',
    },
    'atmosphere': {
      'english': 'atmosphere',
      'arabic': 'جو',
      'amharic': 'ምስራቅ',
      'afaan_oromo': 'hoji',
    },
    'ancient': {
      'english': 'ancient',
      'arabic': 'قديم',
      'amharic': 'ዋዜማ',
      'afaan_oromo': 'aadaa',
    },
    'apology': {
      'english': 'apology',
      'arabic': 'اعتذار',
      'amharic': 'ስህተት',
      'afaan_oromo': 'dhiisi',
    },
    'appliance': {
      'english': 'appliance',
      'arabic': 'جهاز كهربائي',
      'amharic': 'አካል ጥገና',
      'afaan_oromo': 'qamxee',
    },
    'announce': {
      'english': 'announce',
      'arabic': 'إعلان',
      'amharic': 'ማስታወሻ',
      'afaan_oromo': 'inni guddifamu',
    },
    'adapt': {
      'english': 'adapt',
      'arabic': 'تكيف',
      'amharic': 'ማለት',
      'afaan_oromo': 'hojii',
    },
    'anger': {
      'english': 'anger',
      'arabic': 'غضب',
      'amharic': 'አይሁድ',
      'afaan_oromo': 'sirna',
    },
    'admission': {
      'english': 'admission',
      'arabic': 'قبول',
      'amharic': 'በስተቀር',
      'afaan_oromo': 'isaaniif',
    },
    'attribute': {
      'english': 'attribute',
      'arabic': 'صفة',
      'amharic': 'ምስጢር',
      'afaan_oromo': 'naannoo',
    },
    'assistance': {
      'english': 'assistance',
      'arabic': 'مساعدة',
      'amharic': 'መረጃ',
      'afaan_oromo': 'maasuudha',
    },
    'annoy': {
      'english': 'annoy',
      'arabic': 'يزعج',
      'amharic': 'ቀይሕ',
      'afaan_oromo': 'jibbisi',
    },
    'apologize': {
      'english': 'apologize',
      'arabic': 'اعتذر',
      'amharic': 'ስህተት',
      'afaan_oromo': 'dhiisi',
    },
    'arrangement': {
      'english': 'arrangement',
      'arabic': 'ترتيب',
      'amharic': 'ተስማማቂ',
      'afaan_oromo': 'qabeenya',
    },
    'average': {
      'english': 'average',
      'arabic': 'متوسط',
      'amharic': 'መቆያ',
      'afaan_oromo': 'middhaa',
    },
    'approval': {
      'english': 'approval',
      'arabic': 'موافقة',
      'amharic': 'አይሁድ',
      'afaan_oromo': 'lafa kaayyoo',
    },
    'available': {
      'english': 'available',
      'arabic': 'متاح',
      'amharic': 'ይቅር',
      'afaan_oromo': 'bulchiinsa',
    },
    'attitude': {
      'english': 'attitude',
      'arabic': 'موقف',
      'amharic': 'ምዝገባ',
      'afaan_oromo': 'giddugala',
    },
    'anger': {
      'english': 'anger',
      'arabic': 'غضب',
      'amharic': 'አይሁድ',
      'afaan_oromo': 'sirna',
    },
    'agreement': {
      'english': 'agreement',
      'arabic': 'اتفاق',
      'amharic': 'መስማት',
      'afaan_oromo': 'ittiqa',
    },
    'anger': {
      'english': 'anger',
      'arabic': 'غضب',
      'amharic': 'አይሁድ',
      'afaan_oromo': 'sirna',
    },
    'approach': {
      'english': 'approach',
      'arabic': 'اقتراب',
      'amharic': 'መቀመጫ',
      'afaan_oromo': 'atti',
    },
    'announce': {
      'english': 'announce',
      'arabic': 'إعلان',
      'amharic': 'ማስታወሻ',
      'afaan_oromo': 'inni guddifamu',
    },
    'atmosphere': {
      'english': 'atmosphere',
      'arabic': 'جو',
      'amharic': 'ምስራቅ',
      'afaan_oromo': 'hoji',
    },
    'annual': {
      'english': 'annual',
      'arabic': 'سنوي',
      'amharic': 'ዘመን',
      'afaan_oromo': 'bishaanii',
    },
    'argument': {
      'english': 'argument',
      'arabic': 'مناقشة',
      'amharic': 'ውሳኔ',
      'afaan_oromo': 'itti-fufaa',
    },
    'authority': {
      'english': 'authority',
      'arabic': 'سلطة',
      'amharic': 'ተቀባይ',
      'afaan_oromo': 'gaafa',
    },
    'apologize': {
      'english': 'apologize',
      'arabic': 'اعتذر',
      'amharic': 'በስተቀር',
      'afaan_oromo': 'dhiisi',
    },
    'adventure': {
      'english': 'adventure',
      'arabic': 'مغامرة',
      'amharic': 'ሰለሞን',
      'afaan_oromo': 'dudda',
    },
    'accident': {
      'english': 'accident',
      'arabic': 'حادث',
      'amharic': 'ጥብስ',
      'afaan_oromo': 'kolfe',
    },
    'ambulance': {
      'english': 'ambulance',
      'arabic': 'إسعاف',
      'amharic': 'አምባሳደር',
      'afaan_oromo': 'kaasu',
    },
    'attractive': {
      'english': 'attractive',
      'arabic': 'جذاب',
      'amharic': 'አስር',
      'afaan_oromo': 'fiican',
    },
    'argument': {
      'english': 'argument',
      'arabic': 'مناقشة',
      'amharic': 'ውሳኔ',
      'afaan_oromo': 'itti-fufaa',
    },
    'address': {
      'english': 'address',
      'arabic': 'عنوان',
      'amharic': 'አድራሻ',
      'afaan_oromo': 'dheera',
    },
    'appearance': {
      'english': 'appearance',
      'arabic': 'مظهر',
      'amharic': 'ግብዣ',
      'afaan_oromo': 'namni',
    },
    'anger': {
      'english': 'anger',
      'arabic': 'غضب',
      'amharic': 'አይሁድ',
      'afaan_oromo': 'sirna',
    },
    'acquaintance': {
      'english': 'acquaintance',
      'arabic': 'معرفة',
      'amharic': 'ባለቤት',
      'afaan_oromo': 'hundumtu',
    },
    'attention': {
      'english': 'attention',
      'arabic': 'انتباه',
      'amharic': 'ማጣረር',
      'afaan_oromo': 'biroo',
    },
    'advice': {
      'english': 'advice',
      'arabic': 'نصيحة',
      'amharic': 'ማስታወሻ',
      'afaan_oromo': 'hagaya',
    },
    'area': {
      'english': 'area',
      'arabic': 'منطقة',
      'amharic': 'ዝርዝር',
      'afaan_oromo': 'qabeenya',
    },
    'arrive': {
      'english': 'arrive',
      'arabic': 'وصول',
      'amharic': 'መልስ',
      'afaan_oromo': 'bilisummaa',
    },
    'artistic': {
      'english': 'artistic',
      'arabic': 'فني',
      'amharic': 'ብስኩም',
      'afaan_oromo': 'keessummaa',
    },
    'authority': {
      'english': 'authority',
      'arabic': 'سلطة',
      'amharic': 'ተቀባይ',
      'afaan_oromo': 'gaafa',
    },
    'apologize': {
      'english': 'apologize',
      'arabic': 'اعتذر',
      'amharic': 'በስተቀር',
      'afaan_oromo': 'dhiisi',
    },
    'adventure': {
      'english': 'adventure',
      'arabic': 'مغامرة',
      'amharic': 'ሰለሞን',
      'afaan_oromo': 'dudda',
    },
    'achieve': {
      'english': 'achieve',
      'arabic': 'تحقيق',
      'amharic': 'ማድረግ',
      'afaan_oromo': 'itti-fufa',
    },
    'appreciate': {
      'english': 'appreciate',
      'arabic': 'تقدير',
      'amharic': 'ተረጋገመ',
      'afaan_oromo': 're’usuu',
    },
    'approach': {
      'english': 'approach',
      'arabic': 'اقتراب',
      'amharic': 'መቀመጫ',
      'afaan_oromo': 'atti',
    },
    'arrangement': {
      'english': 'arrangement',
      'arabic': 'ترتيب',
      'amharic': 'ተስማማቂ',
      'afaan_oromo': 'qabeenya',
    },
    'annual': {
      'english': 'annual',
      'arabic': 'سنوي',
      'amharic': 'ዘመን',
      'afaan_oromo': 'bishaanii',
    },
    'argument': {
      'english': 'argument',
      'arabic': 'مناقشة',
      'amharic': 'ውሳኔ',
      'afaan_oromo': 'itti-fufaa',
    },
    'address': {
      'english': 'address',
      'arabic': 'عنوان',
      'amharic': 'አድራሻ',
      'afaan_oromo': 'dheera',
    },
    'appearance': {
      'english': 'appearance',
      'arabic': 'مظهر',
      'amharic': 'ግብዣ',
      'afaan_oromo': 'namni',
    },
    'anger': {
      'english': 'anger',
      'arabic': 'غضب',
      'amharic': 'አይሁድ',
      'afaan_oromo': 'sirna',
    },
    'acquaintance': {
      'english': 'acquaintance',
      'arabic': 'معرفة',
      'amharic': 'ባለቤት',
      'afaan_oromo': 'hundumtu',
    },
    'attention': {
      'english': 'attention',
      'arabic': 'انتباه',
      'amharic': 'ማጣረር',
      'afaan_oromo': 'biroo',
    },
    'advice': {
      'english': 'advice',
      'arabic': 'نصيحة',
      'amharic': 'ማስታወሻ',
      'afaan_oromo': 'hagaya',
    },
    'area': {
      'english': 'area',
      'arabic': 'منطقة',
      'amharic': 'ዝርዝር',
      'afaan_oromo': 'qabeenya',
    },
    'arrive': {
      'english': 'arrive',
      'arabic': 'وصول',
      'amharic': 'መልስ',
      'afaan_oromo': 'bilisummaa',
    },
    'artistic': {
      'english': 'artistic',
      'arabic': 'فني',
      'amharic': 'ብስኩም',
      'afaan_oromo': 'keessummaa',
    },
    'authority': {
      'english': 'authority',
      'arabic': 'سلطة',
      'amharic': 'ተቀባይ',
      'afaan_oromo': 'gaafa',
    },
    'apologize': {
      'english': 'apologize',
      'arabic': 'اعتذر',
      'amharic': 'በስተቀር',
      'afaan_oromo': 'dhiisi',
    },
    'adventure': {
      'english': 'adventure',
      'arabic': 'مغامرة',
      'amharic': 'ሰለሞን',
      'afaan_oromo': 'dudda',
    },
    'achieve': {
      'english': 'achieve',
      'arabic': 'تحقيق',
      'amharic': 'ማድረግ',
      'afaan_oromo': 'itti-fufa',
    },
    'appreciate': {
      'english': 'appreciate',
      'arabic': 'تقدير',
      'amharic': 'ተረጋገመ',
      'afaan_oromo': 're’usuu',
    },
    'approach': {
      'english': 'approach',
      'arabic': 'اقتراب',
      'amharic': 'መቀመጫ',
      'afaan_oromo': 'atti',
    },
    'arrangement': {
      'english': 'arrangement',
      'arabic': 'ترتيب',
      'amharic': 'ተስማማቂ',
      'afaan_oromo': 'qabeenya',
    },
    'annual': {
      'english': 'annual',
      'arabic': 'سنوي',
      'amharic': 'ዘመን',
      'afaan_oromo': 'bishaanii',
    },
    'argument': {
      'english': 'argument',
      'arabic': 'مناقشة',
      'amharic': 'ውሳኔ',
      'afaan_oromo': 'itti-fufaa',
    },
    'address': {
      'english': 'address',
      'arabic': 'عنوان',
      'amharic': 'አድራሻ',
      'afaan_oromo': 'dheera',
    },
    'appearance': {
      'english': 'appearance',
      'arabic': 'مظهر',
      'amharic': 'ግብዣ',
      'afaan_oromo': 'namni',
    },
    'anger': {'english': 'anger', 'arabic': 'غضب', 'amharic': 'አይሁ'}

    // Add more words and translations here
  };

  List<String> filteredWords = [];

  @override
  void initState() {
    super.initState();
    filteredWords = dictionary.keys.toList();
  }

  void searchWords(String query) {
    setState(() {
      searchText = query;
      if (query.isNotEmpty) {
        filteredWords = dictionary.keys
            .where((word) => word.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredWords = dictionary.keys.toList();
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
                  hintText: 'Search words in multiple languages...',
                  border: InputBorder.none,
                ),
                onChanged: searchWords,
              )
            : Text('Multi-Language Dictionary'),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      searchController.clear();
                      filteredWords = dictionary.keys.toList();
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
        itemCount: filteredWords.length,
        itemBuilder: (context, index) {
          final word = filteredWords[index];
          final translations = dictionary[word];

          return ListTile(
            title: Text(word),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('English: ${translations['english']}'),
                Text('Arabic: ${translations['arabic']}'),
                Text('Amharic: ${translations['amharic']}'),
                Text('Afaan Oromo: ${translations['afaan_oromo']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
