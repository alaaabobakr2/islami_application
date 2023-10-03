import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami_app/modules/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'home_layout.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "Splash Screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeLayout.routeName);
    });
    var mediaQuery = MediaQuery.of(context).size;
    var appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Image.asset(
          appProvider.isDark()
              ? "assets/images/splash_dark.png"
              : "assets/images/img.png",
          width: mediaQuery.width,
          height: mediaQuery.height,
          fit: BoxFit.fill),
    );
  }
}
