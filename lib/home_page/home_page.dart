import 'package:flutter/material.dart';
import 'package:my_resume/home_page/components/about_me.dart';
import 'package:my_resume/home_page/components/contact.dart';
import 'package:my_resume/home_page/components/experiences.dart';
import 'package:my_resume/home_page/components/header.dart';
import 'package:my_resume/strings/color_strings.dart';
import 'package:my_resume/strings/image_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body);
  }

  Widget get body => Stack(
        alignment: Alignment.center,
        children: [backgroundImage, portfolio],
      );

  Widget get backgroundImage => Container(
        decoration: const BoxDecoration(
          color: ColorStrings.primary,
          image: DecorationImage(
            image: AssetImage(ImageStrings.desktopBackground),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
      );

  Widget get portfolio => Container(
        margin: EdgeInsets.symmetric(horizontal: mobileMode ? 0 : width / 5),
        color: ColorStrings.primary,
        child: ListView(
          children: [header, aboutMe, experiences, contact],
        ),
      );

  double get width => MediaQuery.of(context).size.width;

  bool get mobileMode => width < 1000;

  Widget get header => const HeaderComponent();

  Widget get aboutMe => const AboutMeComponent();

  Widget get experiences => const Experiences();

  Widget get contact => const Contact();
}
