import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedropinto/settings/settings_model.dart';
import 'package:pedropinto/strings/color_strings.dart';
import 'package:pedropinto/strings/text_strings_en.dart';
import 'package:pedropinto/strings/text_strings_pt.dart';
import 'package:provider/provider.dart';

class AboutMeComponent extends StatefulWidget {
  final String? languageCode;
  const AboutMeComponent({this.languageCode, super.key});

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
          Text(aboutMeMainSkill, style: titleStyle1),
          const SizedBox(width: 15),
          Text(aboutMeYear, style: titleStyle2),
          const SizedBox(width: 15),
          Flexible(child: languagesComponent)
        ],
      );

  Widget get languagesComponent => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.message_outlined, color: Colors.white, size: 15),
          const SizedBox(width: 5),
          englishComponent,
          const SizedBox(width: 5),
          Text("|", style: titleStyle2),
          const SizedBox(width: 5),
          portugueseComponent,
        ],
      );

  Widget get portugueseComponent => Consumer<SettingsModel>(
        builder: (context, model, child) => GestureDetector(
          onTap: () => model.changeLanguageCode(portuguese),
          child: Text(portuguese, style: languageStyle(portuguese)),
        ),
      );

  Widget get englishComponent => Consumer<SettingsModel>(
        builder: (context, model, child) => GestureDetector(
          onTap: () => model.changeLanguageCode(english),
          child: Text(english, style: languageStyle(english)),
        ),
      );

  Widget get description => Text(aboutMeDescription, style: descriptionStyle);

  Widget get rightComponent => Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myInfoTile(aboutMeSkillsLabel, aboutMeSkillsValue),
            myInfoTile(aboutMeMethodLabel, aboutMeMethodValue),
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

  String get languageCode => widget.languageCode ?? TextStringsEn.languageCode;

  bool get isPortuguese => languageCode == TextStringsPt.languageCode;

  String get aboutMeMainSkill => isPortuguese
      ? TextStringsPt.aboutMeMainSkill
      : TextStringsEn.aboutMeMainSkill;

  String get aboutMeYear => DateTime.now().year.toString();

  String get aboutMeSkillsLabel => isPortuguese
      ? TextStringsPt.aboutMeSkillsLabel
      : TextStringsEn.aboutMeSkillsLabel;

  String get aboutMeSkillsValue => TextStringsEn.aboutMeSkillsValue;

  String get aboutMeMethodLabel => isPortuguese
      ? TextStringsPt.aboutMeMethodLabel
      : TextStringsEn.aboutMeMethodLabel;

  String get aboutMeMethodValue => TextStringsEn.aboutMeMethodValue;

  String get aboutMeDescription => isPortuguese
      ? TextStringsPt.aboutMeDescription
      : TextStringsEn.aboutMeDescription;

  double get width => MediaQuery.of(context).size.width;

  String get portuguese => TextStringsPt.languageCode;

  String get english => TextStringsEn.languageCode;

  bool get mobileMode => width < 1200;

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

  TextStyle languageStyle(String value) {
    bool isLanguageSelected = languageCode == value;
    return GoogleFonts.oxygen(
      fontWeight: isLanguageSelected ? FontWeight.w800 : FontWeight.w500,
      color: isLanguageSelected ? ColorStrings.green : ColorStrings.white,
      fontSize: isTiny ? (width * 0.025) : 13,
    );
  }

  TextStyle get descriptionLabelStyle => GoogleFonts.oxygen(
        color: ColorStrings.grey,
        fontSize: 14,
      );

  TextStyle get descriptionStyle => GoogleFonts.oxygen(
        color: ColorStrings.white,
        fontSize: 14,
      );
}
