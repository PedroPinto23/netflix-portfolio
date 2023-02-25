import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_resume/data/experience_data.dart';
import 'package:my_resume/data/fetch_experience_data.dart';
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

  Widget get experiences => FutureBuilder(
      future: FetchExperience.getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return loader;
        } else {
          final data = snapshot.data?.experiences ?? [];
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) => experienceTile(data[index], index),
          );
        }
      });

  Widget experienceTile(Experience data, int index) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text("${index + 1}", style: yearsExpStyle),
            imageTile(data.image ?? "", int.parse(data.color ?? "")),
          ],
        ),
      );

  Widget imageTile(String path, int color) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        color: Color(color),
        height: 80,
        width: 130,
        child: Image.asset(path),
      );

  Widget get loader => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
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
