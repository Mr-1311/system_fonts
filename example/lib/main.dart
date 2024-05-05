import 'package:flutter/material.dart';
import 'package:system_fonts/system_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(Calculator().addOne(1).toString()),
        ),
      ),
    );
  }
}
