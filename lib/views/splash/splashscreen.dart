import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/main.dart';
import 'package:global_health_opinion/utilities/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the main screen after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(PageRouteName.login);
    });

    return Scaffold(
      backgroundColor: AppUtilities().primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your logo or other branding elements here
            Image.asset(
              'assets/GHO_Logo.png', // Change this to your logo asset path
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
