import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_resume/data/experience_data.dart';
import 'package:my_resume/data/fetch_experience_data.dart';
import 'package:my_resume/strings/color_strings.dart';
import 'package:my_resume/strings/text_strings.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  int currentLength = 3;
  ExperiencesData? expData;

  @override
  void initState() {
    super.initState();
    FetchExperience.getData().then((data) {
      setState(() => expData = data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topComponent,
          customDivider(),
          experiences,
          if (isTiny) customDivider(showButton: true)
        ],
      ),
    );
  }

  bool get isDataEmpty => expData == null;

  List<Experience> get expList => expData?.experiences ?? [];

  bool get showMore => expList.length > currentLength;

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
              color: ColorStrings.white,
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

  Widget customDivider({bool showButton = false}) {
    return Stack(
      alignment: Alignment.center,
      children: [divider, if (showButton) dividerIconButton],
    );
  }

  int imageColor(Experience data) => int.parse(data.color ?? "");

  Widget get experiences => isDataEmpty
      ? loader
      : ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: currentLength,
          itemBuilder: (_, index) {
            final length = currentLength;
            final i = index + 1;
            final showButton = showMore ? (length == i) : expList.length == i;
            return GestureDetector(
              onTap: () => onTapTile(expList[index].link),
              child: isTiny
                  ? expTileMobile(expList[index], index + 1)
                  : expTileDesktop(expList[index], i, showButton),
            );
          },
        );

  Widget expTileDesktop(Experience data, int index, bool showButton) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$index", style: yearsExpStyle),
              const SizedBox(width: 20),
              imageTile(data.image ?? "", imageColor(data)),
              const SizedBox(width: 20),
              Flexible(child: columnTile(data)),
            ],
          ),
        ),
        customDivider(showButton: showButton),
      ],
    );
  }

  Widget expTileMobile(Experience data, int index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                imageTile(data.image ?? "", imageColor(data)),
                const SizedBox(width: 20),
                descTitleMobile(data, index),
              ],
            ),
          ),
          descriptionItems(data.description ?? [])
        ],
      );

  Widget imageTile(String path, int color) => Container(
        color: Color(color),
        height: 78.36,
        width: 139.17,
        child: Image.asset(path),
      );

  Widget columnTile(Experience data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          descTitleDesktop(data),
          const SizedBox(height: 8),
          descriptionItems(data.description ?? []),
        ],
      );

  Widget descTitleDesktop(Experience data) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: data.company, style: descTitleStyle),
                  TextSpan(text: " | ", style: descSubtitleStyle),
                  TextSpan(text: data.role, style: descSubtitleStyle),
                ],
              ),
            ),
          ),
          Text(data.duration ?? "", style: descDurationStyle),
        ],
      );

  Widget descTitleMobile(Experience data, int index) => Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$index. ${data.company ?? ""}', style: descTitleStyle),
            const SizedBox(height: 3),
            Text(data.role ?? "", style: descSubtitleStyle),
            const SizedBox(height: 3),
            Text(data.duration ?? "", style: descDurationStyle),
          ],
        ),
      );

  Widget descriptionItems(List<Description> descriptions) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.from(descriptions.map(itemsTile).toList()),
      );

  Widget itemsTile(Description data) {
    final item = data.item ?? "";
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text("• $item", style: itemsTileStyle),
    );
  }

  Widget get dividerIconButton => InkWell(
      onTap: () => showMore ? onShowMore() : onShowLess(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white30, width: 3),
        ),
        child: Icon(
          showMore ? showMoreIcon : showLessIcon,
          size: 35,
          color: ColorStrings.white,
        ),
      ));

  IconData get showMoreIcon => Icons.keyboard_arrow_down_outlined;

  IconData get showLessIcon => Icons.keyboard_arrow_up;

  Widget get loader => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      );

  double get width => MediaQuery.of(context).size.width;

  bool get isTiny => width < 500;

  void onTapTile(String? link) {
    if (link?.isNotEmpty ?? false) {
      launchUrlString(link!);
    }
  }

  void onShowMore() => setState(() => currentLength = expList.length);

  void onShowLess() => setState(() => currentLength = 3);

  TextStyle get titleStyle => GoogleFonts.oxygen(
        fontWeight: FontWeight.bold,
        color: ColorStrings.white,
        fontSize: 22,
      );

  TextStyle get yearsExpStyle => GoogleFonts.oxygen(
        fontWeight: FontWeight.w500,
        color: ColorStrings.white,
        fontSize: 16,
      );

  TextStyle get descTitleStyle => GoogleFonts.oxygen(
        fontWeight: FontWeight.w900,
        color: ColorStrings.white,
        fontSize: 14,
      );

  TextStyle get descSubtitleStyle => GoogleFonts.oxygen(
        color: ColorStrings.white,
        fontSize: 13,
      );

  TextStyle get descDurationStyle => GoogleFonts.oxygen(
        color: ColorStrings.white,
        fontStyle: FontStyle.italic,
        fontSize: 13,
      );

  TextStyle get itemsTileStyle => GoogleFonts.oxygen(
        color: ColorStrings.white,
        fontSize: 12,
      );
}
