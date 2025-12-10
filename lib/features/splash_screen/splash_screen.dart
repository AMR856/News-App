import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/image_manager.dart';
import 'package:news_app/core/route_manager/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, RouteManager.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(ImageManager.newsLogoDark),
            const Spacer(),
            Image.asset(
              ImageManager.brandingImageDark,
              scale: 2,
            ),
          ],
        ),
      ),
    );
  }
}
