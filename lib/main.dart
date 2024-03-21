import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pedropinto/settings/settings_model.dart';
import 'package:pedropinto/strings/text_strings_en.dart';
import 'package:pedropinto/widgets/main_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider(
        create: (context) => SettingsModel(),
        child: MaterialApp(
          title: TextStringsEn.headerTitle,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: localizationsDelegates,
          supportedLocales: const [Locale('en'), Locale('pt', 'BR')],
          theme: ThemeData(),
          home: const MainScreen(),
        ));
  }

  Iterable<LocalizationsDelegate>? get localizationsDelegates => const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];
}
