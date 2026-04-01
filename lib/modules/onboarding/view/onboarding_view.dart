import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    // OnboardingViewModel vm = OnboardingViewModel();
    OnboardingViewModel viewModel = Get.put(OnboardingViewModel());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Slider View
          Expanded(
            child: PageView.builder(
              controller: viewModel.pageController,
              itemCount: viewModel.data.length,
              onPageChanged: (int index) {
                viewModel.onPageChanged(index);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(viewModel.data[index]["image"]!, height: 350),
                      Text(
                        viewModel.data[index]["title"]!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        viewModel.data[index]["desc"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Dots Indicator View
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                viewModel.data.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: _buildDot(
                    isActive: viewModel.currentIndex.value == index,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: viewModel.nextPage,
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF7622),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          viewModel.currentIndex.value ==
                                  viewModel.data.length - 1
                              ? "Start"
                              : "Next",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: viewModel.skip,
                  child: const Text(
                    "Skip",
                    style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot({bool isActive = false}) {
    return Container(
      height: 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.orange.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class OnboardingView extends StatelessWidget {
//   const OnboardingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SizedBox.expand(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Image.asset("assets/onboarding/onboarding.png", height: 450),
//               Text(
//                 "Track your  Comfort \n Food here",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "Here You Can find a chef or dish for every\ntaste and color. Enjoy!",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 15),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _buildDot(),
//                     SizedBox(width: 5),
//                     _buildDot(isActive: true),
//                     SizedBox(width: 5),
//                     _buildDot(),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   Container(
//                     height: 60,

//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Color(0xFFEC2578),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Next",
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "Skip",
//                     style: TextStyle(fontSize: 15, color: Colors.blueGrey),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDot({bool isActive = false}) {
//     return Container(
//       height: 10,
//       width: 10,
//       decoration: BoxDecoration(
//         // color: Color(0xFFEC2578),
//         color: isActive
//             ? Color(0xFFEC2578)
//             : Color(0xFFEC2578).withValues(alpha: 0.3),
//         borderRadius: BorderRadius.circular(100),
//       ),
//     );
//   }
// }
