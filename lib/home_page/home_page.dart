import 'package:flutter/material.dart';
import 'package:my_resume/home_page/components/about_me.dart';
import 'package:my_resume/home_page/components/experiences.dart';
import 'package:my_resume/home_page/components/header.dart';
import 'package:my_resume/strings/color_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStrings.background,
      body: body,
    );
  }

  AppBar get appBar => AppBar();

  Widget get body => Padding(
        padding: EdgeInsets.symmetric(horizontal: mobileMode ? 0 : width / 5),
        child: Container(
          color: ColorStrings.primary,
          child: ListView(
            children: [header, aboutMe, experiences],
          ),
        ),
      );

  double get width => MediaQuery.of(context).size.width;

  bool get mobileMode => width < 1000;

  Widget get header => const HeaderComponent();

  Widget get aboutMe => const AboutMeComponent();

  Widget get experiences => const Experiences();
}
