import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_resume/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Pedro Pinto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
