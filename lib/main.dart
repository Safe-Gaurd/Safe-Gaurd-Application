import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:safegaurd/backend/providers/user_provider.dart';
import 'package:safegaurd/screens/auth/login.dart';
import 'package:safegaurd/screens/auth/signup.dart';
import 'package:safegaurd/screens/feed_sub_screens/fav_person_call.dart';
import 'package:safegaurd/screens/feed_sub_screens/phone_call.dart';
import 'package:safegaurd/screens/feed_sub_screens/weather.dart';
// import 'package:safegaurd/screens/auth/forgot_password.dart';
// import 'package:safegaurd/screens/auth/login.dart';
// import 'package:safegaurd/screens/home/feed_screen.dart';
import 'package:safegaurd/screens/home/home.dart';
import 'package:safegaurd/screens/onboarding/onboarding_main.dart';
// import 'package:safegaurd/screens/auth/login.dart';
// import 'package:safegaurd/screens/onboarding/onboarding_main.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// void main(){
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> UserProvider())
      ],
      child: MaterialApp(
        title: 'SafeGuard',
        theme: ThemeData().copyWith(
              textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          )),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

