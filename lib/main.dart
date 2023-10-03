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

class MyCurveX extends Curve {
  @override
  double transformInternal(double t) {
    // t = 0;
    if (t < 0.5) {
      var val = cos(2 * pi * t) * 2;
      return val;
    } else {
      var val = sin(2 * pi * t) * 2;
      return val;
    }
  }
}

class MyCurveY extends Curve {
  @override
  double transformInternal(double t) {
    // t = 0;
    if (t < 0.5) {
      var val = sin(2 * pi * (t - 0.25)) * 2;
      return val;
    } else {
      var val = cos(2 * pi * t) * 2;
      return val;
    }
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
  late Animation<Offset> _xTranslation;
  late Animation<Offset> _yTranslation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _xTranslation = Tween(begin: Offset(2, 0), end: Offset(4, 0)).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutExpo));
    _yTranslation = Tween(begin: Offset(0, 4), end: Offset(0, 6)).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutExpo));
  }

  @override
  void dispose() {
    _xTranslation;
    _yTranslation;
    _animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    _animationController.repeat();
    return Scaffold(
      body: Stack(
        children: [
          SlideTransition(
            position: _yTranslation,
            child: SlideTransition(
              position: _xTranslation,
              child: Container(
                width: 100,
                child: Image.asset("garuda_logo.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
