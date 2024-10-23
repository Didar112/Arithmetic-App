import 'package:flutter/material.dart';
import 'package:newapp4/home_page.dart';

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
