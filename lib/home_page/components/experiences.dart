import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_resume/strings/text_strings.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [topComponent, divider, experiences],
      ),
    );
  }

  Widget get topComponent => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [title, yearsExpComponent],
      );

  Widget get title => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(TextStrings.expTitle, style: titleStyle),
      );

  Widget get yearsExpComponent => Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: yearsExpDecoration,
        child: Row(
          children: [
            Text(TextStrings.expYearsValue, style: yearsExpStyle),
            const Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.white,
              textDirection: TextDirection.rtl,
              size: 30,
            ),
          ],
        ),
      );

  Decoration get yearsExpDecoration => BoxDecoration(
        color: const Color(0xFF282727),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white24),
      );

  Divider get divider => const Divider(thickness: 1, color: Colors.white24);

  Widget get experiences => ListView(
        shrinkWrap: true,
        children: [experienceTile],
      );

  Widget get experienceTile => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text("1", style: yearsExpStyle),
            imageTile,
          ],
        ),
      );

  Widget get imageTile => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        height: 80,
        width: 150,
      );

  TextStyle get titleStyle => GoogleFonts.oxygen(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 22,
      );

  TextStyle get yearsExpStyle => GoogleFonts.oxygen(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: 18,
      );
}
