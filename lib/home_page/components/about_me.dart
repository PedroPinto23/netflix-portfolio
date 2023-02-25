import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_resume/strings/color_strings.dart';
import 'package:my_resume/strings/text_strings.dart';

class AboutMeComponent extends StatefulWidget {
  const AboutMeComponent({super.key});

  @override
  State<AboutMeComponent> createState() => _AboutMeComponentState();
}

class _AboutMeComponentState extends State<AboutMeComponent> {
  @override
  Widget build(BuildContext context) {
    debugPrint("device width: $width");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: mobileMode ? mobileLayout : webLayout,
    );
  }

  Widget get mobileLayout => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [leftComponent, const SizedBox(height: 20), rightComponent]);

  Widget get webLayout => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 2, child: leftComponent),
          const SizedBox(width: 10),
          Flexible(child: rightComponent),
        ],
      );

  Widget get leftComponent => Column(
        children: [titleComponent, const SizedBox(height: 10), description],
      );

  Widget get titleComponent => Row(
        children: [
          Text(TextStrings.aboutMeMainSkill, style: titleStyle1),
          const SizedBox(width: 15),
          Text(TextStrings.aboutMeYear, style: titleStyle2),
          const SizedBox(width: 15),
          Flexible(child: languagesComponent)
        ],
      );

  Widget get languagesComponent => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.message_outlined, color: Colors.white, size: 15),
          const SizedBox(width: 5),
          Text(TextStrings.aboutMeLanguages, style: titleStyle2),
        ],
      );

  Widget get description => Text(
        TextStrings.aboutMeDescription,
        style: descriptionStyle,
      );

  Widget get rightComponent => Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myInfoTile(
                TextStrings.aboutMeEduLabel, TextStrings.aboutMeEduValue),
            myInfoTile(
                TextStrings.aboutMeSkillsLabel, TextStrings.aboutMeSkillsValue),
            myInfoTile(
                TextStrings.aboutMeMethodLabel, TextStrings.aboutMeMethodValue),
          ],
        ),
      );

  Widget myInfoTile(String label, String value) => Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "$label: ", style: descriptionLabelStyle),
              TextSpan(text: value, style: descriptionStyle),
            ],
          ),
        ),
      );

  double get width => MediaQuery.of(context).size.width;

  bool get mobileMode => width < 700;

  bool get isTiny => width < 500;

  TextStyle get titleStyle1 => GoogleFonts.oxygen(
        fontWeight: FontWeight.w500,
        color: ColorStrings.green,
        letterSpacing: 1.2,
        fontSize: 18,
      );

  TextStyle get titleStyle2 => GoogleFonts.oxygen(
        fontWeight: FontWeight.w500,
        color: ColorStrings.white,
        fontSize: isTiny ? (width * 0.025) : 13,
      );

  TextStyle get descriptionStyle => GoogleFonts.oxygen(
        color: ColorStrings.white,
        fontSize: 14,
      );

  TextStyle get descriptionLabelStyle => GoogleFonts.oxygen(
        color: ColorStrings.grey,
        fontSize: 14,
      );
}
