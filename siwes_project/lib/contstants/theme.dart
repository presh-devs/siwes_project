import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siwes_project/contstants/colors.dart';

class ProjectTheme {
  
  static ThemeData materialTheme(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Theme.of(context).copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        primary: ProjectColors.primaryColor,
        // secondary: const Color(0xFFF97316),
      ),
      textTheme: GoogleFonts.georamaTextTheme(textTheme).copyWith(
      bodyMedium: GoogleFonts.inter(textStyle: textTheme.bodyMedium),
    ),
      useMaterial3: true,
    );
  }
}
