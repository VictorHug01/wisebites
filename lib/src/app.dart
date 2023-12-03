import 'package:flutter/material.dart';
import 'package:zerowate/src/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wise Bites',
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all(Color(0xffe63946))),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffe63946)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
