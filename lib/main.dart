import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog_githubbased/component/my_colors.dart';
import 'package:techblog_githubbased/gen/fonts.gen.dart';
import 'package:techblog_githubbased/view/splashscreen.dart';

void main()async  {
  await GetStorage.init();

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusbarcolors,
      systemNavigationBarColor: SolidColors.navigationbarcolors,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
        locale: const Locale('fa'),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(width: 2)),
              filled: true),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(textStyle: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return textTheme.bodyLarge;
                } else {
                  return textTheme.bodyMedium;
                }
              },
            ), backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return SolidColors.bluepen;
                } else {
                  return SolidColors.maincolor;
                }
              },
            ), foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.white;
                } else {
                  return Colors.white;
                }
              },
            )),
          ),
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: SolidColors.postertitle),
              titleSmall: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: SolidColors.postersubtitle),
              bodyMedium: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: SolidColors.hashtagtitlecolors),
              titleMedium: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: SolidColors.bluepen),
              labelMedium: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: SolidColors.postersubtitle),
              bodySmall: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              displayMedium: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              bodyLarge: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              labelSmall: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: SolidColors.hintcolors),
              displaySmall: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: SolidColors.maincolor),
              displayLarge: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              headlineSmall: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: SolidColors.dvidercolor),
              headlineMedium: TextStyle(
                  fontFamily: FontFamily.dana,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: SolidColors.contentcolors)),
        ),
        home:  const SplashScreen());
  }
}
