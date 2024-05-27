import 'package:air_plane/layout/home_layout.dart';
import 'package:air_plane/layout/login_page_layout.dart';
import 'package:air_plane/layout/register_screen_layout.dart';
import 'package:air_plane/modules/email_verification_screen.dart';
import 'package:air_plane/modules/profile_page.dart';
import 'package:air_plane/modules/reset_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'modules/search_result_screen.dart';
import 'modules/search_screen_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home_page': (context) => const HomeScreenLayout(),
        '/login_page': (context) => const LoginScreenLayout(),
        '/register_page': (context) => const RegisterScreenLayout(),
        '/search_screen': (context) => const SearchScreenModule(),
        '/search_result': (context) => const SearchResultScreen(),
        '/profile_screen': (context) => const ProfileScreen(),
        '/reset_password': (context) => PasswordResetScreen(),
        '/email_verification': (context) => EmailVerificationScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginScreenLayout()
          : const HomeScreenLayout(),
    );
  }
}
