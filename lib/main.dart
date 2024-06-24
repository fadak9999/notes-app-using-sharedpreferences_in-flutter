import 'package:flutter/material.dart';
import 'package:notes_app_flutter/add_notes.dart';
import 'package:notes_app_flutter/introduction.dart';
import 'package:notes_app_flutter/login.dart';
import 'package:notes_app_flutter/notes.dart';
import 'package:notes_app_flutter/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
      routes: {
        'introduction': (context) => const introduction(),
        'login': (context) => const login(),
        'add_notes': (context) => const add_notes(),
        'notes': (context) => const notes(),
      },
    );
  }
}
