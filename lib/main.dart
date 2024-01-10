import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab_11_main/firebase_options.dart';
import 'package:lab_11_main/screens/home.dart';
import 'package:lab_11_main/screens/sign_in.dart';
import 'package:lab_11_main/screens/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'sign_in',
      routes: {
        'sign_in': (context) => const SignIn(),
        'sign_up': (context) => const SignUp(),
      },
    );
  }
}
