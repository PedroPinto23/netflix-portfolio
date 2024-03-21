import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pedropinto/strings/color_strings.dart';
import 'package:pedropinto/strings/image_strings.dart';
import 'package:pedropinto/strings/text_strings_en.dart';
import 'package:pedropinto/strings/text_strings_pt.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HeaderComponent extends StatefulWidget {
  final String? languageCode;
  const HeaderComponent({this.languageCode, super.key});

  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
  bool iconLiked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(right: 0, child: photoComponent),
          Positioned(left: 0, child: nameTitleComponent)
        ],
      ),
    );
  }

  String get languageCode => widget.languageCode ?? TextStringsEn.languageCode;

  bool get isPortuguese => languageCode == TextStringsPt.languageCode;

  double get fontSizeTitleDefault => 40.0;

  double get fontSizeTitle => width / 13;

  double get fontSizeButtonDefault => 16.0;

  double get fontSizeButton => width / 25;

  double get width => MediaQuery.of(context).size.width;

  bool get mobileMode => width < 500;

  String get headerTitle => isPortuguese ? TextStringsPt.headerTitle : TextStringsEn.headerTitle;

  String get resumeText => isPortuguese ? TextStringsPt.resumeText : TextStringsEn.resumeText;

  String get aboutMeResumeLink => isPortuguese ? TextStringsPt.aboutMeResumeLink : TextStringsEn.aboutMeResumeLink;

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
          const SizedBox(width: 5),
          likeIconButton,
        ],
      );

  MaterialButton get resumeButton => MaterialButton(
        height: 50,
        onPressed: onTapResume,
        color: ColorStrings.white,
        child: Row(
          children: [playIcon, Text(resumeText, style: resumeButtonStyle)],
        ),
      );

  Icon get playIcon => const Icon(
        Icons.play_arrow_rounded,
        color: Colors.black,
        size: 40,
      );

  Widget get addFavoritesButton => Container(
        padding: const EdgeInsets.all(5),
        decoration: circleDecoration,
        child: const Icon(
          Icons.add,
          color: ColorStrings.grey,
          size: 30,
        ),
      );

  Widget get likeIconButton => InkWell(
        onTap: onTapLike,
        child: Stack(
          alignment: Alignment.center,
          children: [whiteBorder, likeIcon],
        ),
      );

  Widget get whiteBorder => Container(
        decoration: circleDecoration,
        child: const Icon(Icons.abc, color: Colors.transparent, size: 40),
      );

  BoxDecoration get circleDecoration => BoxDecoration(
        border: Border.all(color: Colors.white),
        shape: BoxShape.circle,
      );

  Widget get likeIcon => Lottie.asset(
        ImageStrings.lottieLikeIcon,
        height: 55,
        repeat: false,
        animate: iconLiked,
      );

  Widget get photoComponent => Container(
        foregroundDecoration: BoxDecoration(gradient: profileGradient),
        child: Image.asset(profileImage, width: mobileMode ? width : 500),
      );

  LinearGradient get profileGradient => LinearGradient(
        begin: mobileMode ? Alignment.topCenter : Alignment.centerRight,
        end: mobileMode ? Alignment.bottomCenter : Alignment.centerLeft,
        colors: const [Colors.transparent, Colors.black],
      );

  void onTapResume() => launchUrlString(aboutMeResumeLink);

  void onTapLike() => setState(() => iconLiked = true);

  TextStyle get titleStyle => GoogleFonts.chakraPetch(
        color: ColorStrings.white,
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
