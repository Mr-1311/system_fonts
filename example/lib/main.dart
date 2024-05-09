import 'package:flutter/material.dart';
import 'package:system_fonts/system_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String selectedFont = 'NONE';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SystemFontSelector(
                onFontSelected: (p0) => setState(() {
                  selectedFont = p0;
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      'Selected font is <$selectedFont> and here how it looks with ',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontFamily: selectedFont),
                    ),
                    Text(
                      'BOLD, ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontFamily: selectedFont, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ITALIC, ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontFamily: selectedFont, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'AND COLOR',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontFamily: selectedFont,
                            color: Colors.blue,
                          ),
                    ),
                    Text(
                      ' attributes.',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontFamily: selectedFont),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
