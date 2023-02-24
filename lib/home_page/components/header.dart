import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_resume/strings/image_strings.dart';
import 'package:my_resume/strings/text_strings.dart';

class HeaderComponent extends StatefulWidget {
  const HeaderComponent({super.key});

  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(right: 0, child: photoComponent),
          Positioned(left: 0, child: nameTitleComponent)
        ],
      ),
    );
  }

  double get fontSizeTitleDefault => 40.0;

  double get fontSizeTitle => width / 15;

  double get fontSizeButtonDefault => 14.0;

  double get fontSizeButton => width / 40;

  double get width => MediaQuery.of(context).size.width;

  bool get mobileMode => width < 450;

  String get headerTitle => TextStrings.headerTitle;

  String get resumeText => TextStrings.resumeText;

  String get profileImage => ImageStrings.profileImage;

  Widget get nameTitleComponent => Padding(
        padding: const EdgeInsets.only(left: 20, top: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(headerTitle, style: titleStyle),
            const SizedBox(height: 20),
            headerButtons,
          ],
        ),
      );

  Row get headerButtons => Row(
        children: [
          resumeButton,
          const SizedBox(width: 10),
          addFavoritesButton,
          const SizedBox(width: 10),
          likeIconButton,
        ],
      );

  MaterialButton get resumeButton => MaterialButton(
        onPressed: () {},
        color: Colors.white,
        child: Row(
          children: [playIcon, Text(resumeText, style: resumeButtonStyle)],
        ),
      );

  Icon get playIcon =>
      const Icon(Icons.play_arrow_rounded, color: Colors.black);

  Widget get addFavoritesButton => Container(
        decoration: likeDecoration,
        child: const Icon(
          Icons.add,
          color: Colors.white24,
          size: 30,
        ),
      );

  Widget get likeIconButton => Container(
        decoration: likeDecoration,
        child: likeIcon,
      );

  BoxDecoration get likeDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        border: Border.all(color: Colors.white),
      );

  Image get likeIcon => Image.asset(
        ImageStrings.likeIcon,
        height: 30,
        color: Colors.white24,
      );

  Widget get photoComponent => Container(
        foregroundDecoration: BoxDecoration(gradient: profileGradient),
        child: Image.asset(profileImage),
      );

  LinearGradient get profileGradient => LinearGradient(
        begin: mobileMode ? Alignment.topCenter : Alignment.centerRight,
        end: mobileMode ? Alignment.bottomCenter : Alignment.centerLeft,
        colors: const [Colors.transparent, Colors.black],
      );

  TextStyle get titleStyle => GoogleFonts.chakraPetch(
        color: Colors.white,
        fontSize: mobileMode && (fontSizeTitle < fontSizeTitleDefault)
            ? fontSizeTitle
            : fontSizeTitleDefault,
      );

  TextStyle get resumeButtonStyle => GoogleFonts.oxygen(
        fontWeight: FontWeight.bold,
        fontSize: mobileMode && (fontSizeButton < fontSizeButtonDefault)
            ? fontSizeButton
            : fontSizeButtonDefault,
      );
}
