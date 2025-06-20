import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/screens/home_screen/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  // 👈 Add this key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            titleWidget: const SizedBox(),
            bodyWidget: const SizedBox(),
            decoration: const PageDecoration(
              imagePadding: EdgeInsets.zero,
              contentMargin: EdgeInsets.zero,
              fullScreen: true,
              bodyFlex: 0,
              imageFlex: 3,
            ),
            image: CustomOnboardingPage(
              title: 'Welcome to the Future of Mobility!',
              subtitle:
                  'Experience zero-emission rides with Lepster’s electric scooters, bikes, and cars — all from one powerful app.',
              imageAsset: onboarding1,
              onBack: () => introKey.currentState?.previous(),
            ),
          ),
          PageViewModel(
            titleWidget: const SizedBox(),
            bodyWidget: const SizedBox(),
            decoration: const PageDecoration(
              imagePadding: EdgeInsets.zero,
              contentMargin: EdgeInsets.zero,
              fullScreen: true,
              bodyFlex: 0,
              imageFlex: 3,
            ),
            image: CustomOnboardingPage(
              title: "Control at Your Fingertips.",
              subtitle:
                  'Start, stop, lock, locate, or monitor your vehicle — right from your phone..',
              imageAsset: onboarding2,
              onBack: () => introKey.currentState?.previous(),
            ),
          ),
          PageViewModel(
            titleWidget: const SizedBox(),
            bodyWidget: const SizedBox(),
            decoration: const PageDecoration(
              imagePadding: EdgeInsets.zero,
              contentMargin: EdgeInsets.zero,
              fullScreen: true,
              bodyFlex: 0,
              imageFlex: 3,
            ),
            image: CustomOnboardingPage(
              title: 'Smart Charging Made Simple.',
              subtitle:
                  'Track battery status, find charging stations nearby, and schedule charging with ease.',
              imageAsset: onboarding3,
              onBack: () => introKey.currentState?.previous(),
            ),
          ),
        ],
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          );
        },

        showNextButton: true,
        showSkipButton: false,
        done: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightGreenColor1,
            ),
            child: const Text(
              "Next",
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ),
        next: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightGreenColor1,
            ),
            child: const Text(
              "Next",
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ),

        dotsDecorator: const DotsDecorator(
          activeColor: Colors.green,
          color: AppColors.lightGrey,
          size: Size(8, 8),
          activeSize: Size(50, 8),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}

// 🟢 This is the key part: Left-heavy curved shape
class CleanTopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.55); // start at left mid
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.30, // center dip
      size.width,
      size.height * 0.45, // right mid
    );
    path.lineTo(size.width, 0); // top right
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomOnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;
  final dynamic onBack;

  const CustomOnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Curved green background
        Positioned.fill(
          child: ClipPath(
            clipper: CleanTopCurveClipper(), // concave inward
            child: Container(color: AppColors.curvedColor),
          ),
        ),

        // Back button
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                onBack();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),

        // Scooter image
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Image.asset(imageAsset),
          ),
        ),

        // Bottom content
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              // color: Color(0xFFF8F8F8),
              color: AppColors.lightCreame,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 36,

                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  subtitle,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
