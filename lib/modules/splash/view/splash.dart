import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

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
