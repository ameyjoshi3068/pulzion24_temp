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
        home: RoteteImage());
  }
}

class RoteteImage extends StatefulWidget {
  const RoteteImage({super.key});

  @override
  State<RoteteImage> createState() => _RoteteImageState();
}

class _RoteteImageState extends State<RoteteImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 80));

    _rotation = Tween(begin: 0.0, end: 2 * pi).animate(_animationController);
  }

  @override
  void dispose() {
    _rotation;
    _animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    _animationController.repeat();
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: RotationTransition(
              turns: _rotation,
              child: Container(
                width: 400,
                child: Image.asset("frame.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
