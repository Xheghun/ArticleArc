
import 'package:article_finder/bloc/article_list_bloc.dart';
import 'package:article_finder/bloc/block_provider.dart';
import 'package:article_finder/ui/app_colors.dart';
import 'package:article_finder/ui/article_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ArticleArc());
}

class ArticleArc extends StatelessWidget {
  const ArticleArc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w700BitterFont = GoogleFonts.bitter(
      fontWeight: FontWeight.w700,
    );
    return BlocProvider(
      bloc: ArticleListBloc(),
      child: MaterialApp(
        title: 'Article Arc',
        home: ArticleListScreen(),
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
      ),
    );
  }
}
