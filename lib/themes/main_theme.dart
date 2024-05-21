import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {

  static ThemeData tmdbTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: Colors.white
    ),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: const Color.fromRGBO(247, 248, 250, 0),
      iconTheme: const IconThemeData(
        color: Colors.black45,
        size: 30
      ),
      titleTextStyle: GoogleFonts.notoSans(
        fontSize: 40,
        fontWeight: FontWeight.w900,
        color: Colors.black
      )
      
    )
  );

}


