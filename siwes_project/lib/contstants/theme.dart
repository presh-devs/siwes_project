import 'package:flutter/material.dart';

class ProjectTheme {
  static ThemeData materialTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        primary: Colors.blue,
        // secondary: const Color(0xFFF97316),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            //fontSizeFactor: 1.2,
            fontSizeDelta: 2.0,
            // fontFamily: 'NotoSans',
          ),
      useMaterial3: true,
    );
  }
}
