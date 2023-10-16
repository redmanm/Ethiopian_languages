import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import '/login/features/app/splash_screen/splash_screen.dart';
import '/login/features/user_auth/presentation/pages/home_page.dart';
import '/login/features/user_auth/presentation/pages/login_page.dart';
import '/login/features/user_auth/presentation/pages/sign_up_page.dart';
import 'homepage/h.dart';

//flutter run --no-sound-null-safety
//flutter pub get
//flutter build apk --release --no-sound-null-safety
//flutter build apk --dart-define=Dart.vm.options=-Xlint:unchecked
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCdyoez6oAJtMsDafxBpsk0ZA1LfVsRYKg",
        appId: "1:517818955273:android:08ffe88f8882a92e52ead8",
        messagingSenderId: "517818955273",
        projectId: "ethiopian-languages",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => homepages(),
      },
    );
  }
}
