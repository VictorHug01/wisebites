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
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFFFF0000)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
