import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {
  static const Color _backgroundColor = Color.fromARGB(240, 247, 248, 250);

  static ThemeData tmdbTheme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(backgroundColor: _backgroundColor),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: _backgroundColor,
          iconTheme: const IconThemeData(color: Colors.black45, size: 30),
          titleTextStyle: GoogleFonts.notoSans(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.black)));
}
