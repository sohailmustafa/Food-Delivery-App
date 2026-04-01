import 'package:flutter/material.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Padding(
          padding: const .symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/onboarding/onboarding_3.png", height: 450),
              Image.asset("assets/onboarding/onboarding_1.png"),
              Image.asset("assets/onboarding/onboarding_3.png"),
              Text(
                "All your favorites",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Get all your loved foods in one once place, you just place the orer we do the rest",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(),
                    SizedBox(width: 5),
                    _buildDot(isActive: true),
                    SizedBox(width: 5),
                    _buildDot(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDot({bool isActive = false}) {
  return Container(
    height: 10,
    width: 10,
    decoration: BoxDecoration(
      color: isActive ? Colors.orange : Colors.orange.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(100),
    ),
  );
}
