import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/characters_page.dart';
import 'screens/counter_kyomoto_page.dart';
import 'screens/anime_info_page.dart';
import 'screens/notes_page.dart';
import 'screens/opinion_page.dart';
import 'screens/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Error initializing Firebase: $e");
    // You might want to handle the error gracefully here, perhaps show an error message to the user
  }
  runApp(const LookBackApp());
}

class LookBackApp extends StatelessWidget {
  const LookBackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Look Back Fan App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Ensure your app targets Material 3 components
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/characters': (context) => const CharactersPage(),
        '/anime-info': (context) => const AnimeInfoPage(),
        '/counter-kyomoto': (context) => const CounterKyomotoPage(),
        '/notes': (context) => const NotesPage(),
        '/opinions': (context) => OpinionPage(),
        '/auth': (context) => const AuthPage(),
      },
      onUnknownRoute: (settings) {
        // Handle unknown routes gracefully, can navigate to a 404 page or error page
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      },
    );
  }
}
