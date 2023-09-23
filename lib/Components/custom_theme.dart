import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: GoogleFonts.montserratTextTheme(),
  );
  static final ThemeData darkTheme =
      ThemeData(brightness: Brightness.dark, useMaterial3: true);
}
