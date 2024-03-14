import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wasteapp/page/auth/intro_page.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      NavigationService.offAll(IntroPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child:
                  Image.asset("assets/images/splash.png", fit: BoxFit.cover)),
        ],
      ),
    );
  }
}
