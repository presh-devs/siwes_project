import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siwes_project/contstants/theme.dart';
import 'package:siwes_project/main/views/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //TODO change name later 
      title: 'Flutter Demo',
      theme: ProjectTheme.materialTheme(context),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
