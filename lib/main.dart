// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mywebsite/src/sections/mainSection.dart';
import 'package:mywebsite/src/utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('en','UZ'),
        Locale('en','RU'),
        Locale('en','US')
      ],
      path: "assets/translations",
      fallbackLocale: Locale('en','UZ'),
  )

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Energy Travel',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        // fontFamily: "Montserrat",
        highlightColor: kPrimaryColor,
      ),
      home: MainPage(),
    );
  }
}
