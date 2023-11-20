import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late Animation<double> _progress;
  double _opacity = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _progress = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.6,
          1,
          curve: Curves.easeIn,
        ),
      ),
    );
    if (mounted) {
      setState(() {
        _opacity = 1;
      });
      _animationController.forward();
    }

    _timer = Timer(const Duration(seconds: 2), () {
      Navigator.of(context).popAndPushNamed("/home");
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 500),
          child: AnimatedIcon(
            icon: AnimatedIcons.home_menu,
            progress: _progress,
            size: 34,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
