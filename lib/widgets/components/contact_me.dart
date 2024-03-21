import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedropinto/strings/color_strings.dart';
import 'package:pedropinto/strings/text_strings_en.dart';
import 'package:pedropinto/strings/text_strings_pt.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactComponent extends StatefulWidget {
  final String? languageCode;
  const ContactComponent({this.languageCode, super.key});

  @override
  State<ContactComponent> createState() => _ContactComponentState();
}

class _ContactComponentState extends State<ContactComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, email, linkedIn, phone, root, github],
      ),
    );
  }

  Widget get title => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(contactTitle, style: titleStyle),
      );

  Widget myContactTile(String label, String value) => Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "$label: ", style: contactLabelStyle),
              TextSpan(text: value, style: contactStyle),
            ],
          ),
        ),
      );

  Widget get email => InkWell(
        onTap: onTapEmail,
        child: myContactTile(contactEmailLabel, contactEmail),
      );

  Widget get linkedIn => InkWell(
      onTap: () => onTapLink(contactLinkedIn),
      child: myContactTile(contactLinkedInLabel, contactLinkedIn));

  Widget get phone => InkWell(
      onTap: onTapPhone, child: myContactTile(contactPhoneLabel, contactPhone));

  Widget get root => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(contactRootText, style: rootStyle),
      );

  Widget get github => InkWell(
      onTap: () => onTapLink(contactgithub),
      child: myContactTile(contactgithubLabel, contactgithub));

  String get languageCode => widget.languageCode ?? TextStringsEn.languageCode;

  bool get isPortuguese => languageCode == TextStringsPt.languageCode;

  String get contactTitle => isPortuguese
      ? TextStringsPt.contactTitle
      : TextStringsEn.contactTitle;

  String get contactEmailLabel => isPortuguese
      ? TextStringsPt.contactEmailLabel
      : TextStringsEn.contactEmailLabel;

  String get contactEmail => TextStringsEn.contactEmail;

  String get contactLinkedInLabel => TextStringsEn.contactLinkedInLabel;

  String get contactLinkedIn => TextStringsEn.contactLinkedIn;

  String get contactPhoneLabel => isPortuguese
      ? TextStringsPt.contactPhoneLabel
      : TextStringsEn.contactPhoneLabel;

  String get contactPhone => TextStringsEn.contactPhone;

  String get contactRootText => isPortuguese
      ? TextStringsPt.contactRootText
      : TextStringsEn.contactRootText;

  String get contactgithubLabel => isPortuguese
      ? TextStringsPt.contactgithubLabel
      : TextStringsEn.contactgithubLabel;

  String get contactgithub => TextStringsEn.contactgithub;

  Future<void> onTapEmail() async => await launchUrlString(
        "mailto:${TextStringsEn.contactEmail}",
      );

  Future<void> onTapPhone() async => await launchUrlString(
        "whatsapp://send?phone=${TextStringsEn.contactPhone}",
      );

  Future<void> onTapLink(String link) async => await launchUrlString(link);

  TextStyle get titleStyle => GoogleFonts.oxygen(
        fontWeight: FontWeight.bold,
        color: ColorStrings.white,
        fontSize: 22,
      );

  TextStyle get contactLabelStyle => GoogleFonts.oxygen(
        color: ColorStrings.grey,
        fontSize: 14,
      );

  TextStyle get contactStyle => GoogleFonts.oxygen(
        color: ColorStrings.white,
        letterSpacing: 1.2,
        fontSize: 14,
      );

  TextStyle get rootStyle => GoogleFonts.chakraPetch(
        color: ColorStrings.green,
        letterSpacing: 1.2,
        fontSize: 14,
      );
}
