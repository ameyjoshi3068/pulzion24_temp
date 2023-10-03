import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TranslateImage());
  }
}

class TranslateImage extends StatefulWidget {
  const TranslateImage({super.key});

  @override
  State<TranslateImage> createState() => _TranslateImageState();
}

class _TranslateImageState extends State<TranslateImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _Translation1;
  late Animation<Offset> _Translation2;
  // double width = 1080, height = 1920;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _Translation1 = Tween(begin: Offset(4, 8), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
    _Translation2 = Tween(begin: Offset(0, 8), end: Offset(4, 0)).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _Translation1;
    _Translation2;
    _animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    _animationController.repeat();
    return Scaffold(
      body: Stack(
        children: [
          SlideTransition(
            position: _Translation1,
            child: Container(
              width: 100,
              child: Image.asset("logo.png"),
            ),
          ),
          SlideTransition(
            position: _Translation2,
            child: Container(
              width: 100,
              child: Image.asset("logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}
