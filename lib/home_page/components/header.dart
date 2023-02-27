import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:my_resume/strings/color_strings.dart';
import 'package:my_resume/strings/image_strings.dart';
import 'package:my_resume/strings/text_strings.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HeaderComponent extends StatefulWidget {
  const HeaderComponent({super.key});

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

  double get fontSizeTitleDefault => 40.0;

  double get fontSizeTitle => width / 15;

  double get fontSizeButtonDefault => 14.0;

  double get fontSizeButton => width / 40;

  double get width => MediaQuery.of(context).size.width;

  bool get mobileMode => width < 500;

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
          const SizedBox(width: 5),
          likeIconButton,
        ],
      );

  MaterialButton get resumeButton => MaterialButton(
        onPressed: onTapResume,
        color: ColorStrings.white,
        child: Row(
          children: [playIcon, Text(resumeText, style: resumeButtonStyle)],
        ),
      );

  Icon get playIcon => const Icon(
        Icons.play_arrow_rounded,
        color: Colors.black,
      );

  Widget get addFavoritesButton => Container(
        decoration: likeDecoration,
        child: const Icon(
          Icons.add,
          color: Color(0x3CFFFFFF),
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
        decoration: likeDecoration,
        child: const Icon(Icons.abc, color: Colors.transparent, size: 30),
      );

  BoxDecoration get likeDecoration => BoxDecoration(
        border: Border.all(color: Colors.white),
        shape: BoxShape.circle,
      );

  Widget get likeIcon => Lottie.asset(
        ImageStrings.lottieLikeIcon,
        height: 40,
        repeat: false,
        animate: iconLiked,
      );

  Widget get photoComponent => Container(
        foregroundDecoration: BoxDecoration(gradient: profileGradient),
        child: Image.asset(profileImage, width: mobileMode ? width : null),
      );

  LinearGradient get profileGradient => LinearGradient(
        begin: mobileMode ? Alignment.topCenter : Alignment.centerRight,
        end: mobileMode ? Alignment.bottomCenter : Alignment.centerLeft,
        colors: const [Colors.transparent, Colors.black],
      );

  void onTapResume() => launchUrlString(TextStrings.aboutMeResumeLink);

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
