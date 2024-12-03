
import 'package:article_finder/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ArticleFinder());
}

class ArticleFinder extends StatelessWidget {
  const ArticleFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w700BitterFont = GoogleFonts.bitter(
      fontWeight: FontWeight.w700,
    );
    return MaterialApp(
      title: 'Article Arc',
      home: Container(),
      theme: ThemeData(
        primarySwatch: AppColors.black,
        primaryColor: AppColors.black,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: AppColors.green,
              primary: AppColors.black,
            ),
        scaffoldBackgroundColor: AppColors.grey,
        canvasColor: AppColors.grey,
        primaryTextTheme: TextTheme(
          headlineLarge: w700BitterFont,
        ),
        textTheme: TextTheme(

          labelSmall: w700BitterFont.apply(color: AppColors.black),
            headlineLarge: w700BitterFont.apply(color: AppColors.black),
          bodyMedium: TextStyle(color: AppColors.black),
        ),
      ),
    );
  }
}
