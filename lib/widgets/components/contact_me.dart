import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_resume/strings/color_strings.dart';
import 'package:my_resume/strings/text_strings.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactComponent extends StatefulWidget {
  const ContactComponent({super.key});

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
        child: Text(TextStrings.contactTitle, style: titleStyle),
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
        child: myContactTile(
          TextStrings.contactEmailLabel,
          TextStrings.contactEmail,
        ),
      );

  Widget get linkedIn => InkWell(
      onTap: () => onTapLink(TextStrings.contactLinkedIn),
      child: myContactTile(
        TextStrings.contactLinkedInLabel,
        TextStrings.contactLinkedIn,
      ));

  Widget get phone => InkWell(
      onTap: onTapPhone,
      child: myContactTile(
        TextStrings.contactPhoneLabel,
        TextStrings.contactPhone,
      ));

  Widget get root => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(TextStrings.contactRootText, style: rootStyle),
      );

  Widget get github => InkWell(
      onTap: () => onTapLink(TextStrings.contactgithub),
      child: myContactTile(
        TextStrings.contactgithubLabel,
        TextStrings.contactgithub,
      ));

  Future<void> onTapEmail() async => await launchUrlString(
        "mailto:${TextStrings.contactEmail}",
      );

  Future<void> onTapPhone() async => await launchUrlString(
        "whatsapp://send?phone=${TextStrings.contactPhone}",
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
