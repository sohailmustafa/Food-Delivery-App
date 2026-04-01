import 'package:flutter/material.dart';
import 'package:flutter_application_sample/modules/onboarding/view/onboarding_view.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.to(OnboardingView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEEDA),
      body: SizedBox.expand(
        child: Center(child: Image.asset("assets/onboarding/logo.png")),
      ),
    );
  }
}
