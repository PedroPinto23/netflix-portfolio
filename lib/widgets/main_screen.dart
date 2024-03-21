import 'package:flutter/material.dart';
import 'package:pedropinto/settings/settings_model.dart';
import 'package:pedropinto/widgets/components/about_me.dart';
import 'package:pedropinto/widgets/components/contact_me.dart';
import 'package:pedropinto/widgets/components/experiences.dart';
import 'package:pedropinto/widgets/components/header.dart';
import 'package:pedropinto/strings/color_strings.dart';
import 'package:pedropinto/strings/image_strings.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(body: body);

  Widget get body => Stack(
        alignment: Alignment.center,
        children: [backgroundImage, portfolio],
      );

  Widget get backgroundImage => Container(
        decoration: const BoxDecoration(
          color: ColorStrings.primary,
          image: DecorationImage(
            image: AssetImage(ImageStrings.desktopBackground),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
      );

  Widget get portfolio => Container(
        margin: EdgeInsets.symmetric(horizontal: mobileMode ? 0 : width / 5),
        color: ColorStrings.primary,
        child: Consumer<SettingsModel>(
          builder: (context, model, child) => ListView(
            children: [
              HeaderComponent(languageCode: model.languageCode),
              AboutMeComponent(languageCode: model.languageCode),
              ExpComponent(languageCode: model.languageCode),
              ContactComponent(languageCode: model.languageCode),
            ],
          ),
        ),
      );

  double get width => MediaQuery.of(context).size.width;

  bool get mobileMode => width < 1000;
}
