import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:safegaurd/screens/auth/forgot_password.dart';
// import 'package:safegaurd/screens/auth/login.dart';
import 'package:safegaurd/screens/home/main_screen.dart';
// import 'package:safegaurd/screens/auth/login.dart';
// import 'package:safegaurd/screens/onboarding/onboarding_main.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeGuard',
      theme: ThemeData().copyWith(
            textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        )),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

