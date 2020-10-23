import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:karvaan/screens/services/authentication.dart';
import 'package:karvaan/screens/wrapper.dart';
import 'screens/authentication/LogInPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', "US"), //suported language set to US English
      ],
      debugShowCheckedModeBanner: false,
      title: 'Karvaan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        //test for git
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthService().handleAuth(),
    );
  }
}
