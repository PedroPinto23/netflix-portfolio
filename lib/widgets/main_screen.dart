import 'package:flutter/material.dart';
import 'package:my_resume/widgets/components/about_me.dart';
import 'package:my_resume/widgets/components/contact_me.dart';
import 'package:my_resume/widgets/components/experiences.dart';
import 'package:my_resume/widgets/components/header.dart';
import 'package:my_resume/strings/color_strings.dart';
import 'package:my_resume/strings/image_strings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(body: body);

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

  Widget get experiences => const ExpComponent();

  Widget get contact => const ContactComponent();
}
