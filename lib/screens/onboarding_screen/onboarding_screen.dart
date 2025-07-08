import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lepster/core/constants/app_color.dart';
import 'package:lepster/core/constants/app_sizing.dart';
import 'package:lepster/core/constants/image_path.dart';
import 'package:lepster/widgets/custom_page_route.dart';
import '../../core/constants/text_style.dart';
import '../auth_screen/signin_screen.dart';

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
            CustomPageRoute(child: SignInScreen()),
          );
        },

        showNextButton: true,
        showSkipButton: false,
        done: Container(
          width: screenWidth(context),
          padding: verticalPadding(context: context, padding: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightGreenColor1,
          ),
          child: Center(child: Text("Next", style: whiteText16600)),
        ),
        next: Container(
          width: screenWidth(context),
          padding: verticalPadding(context: context, padding: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightGreenColor1,
          ),
          child: Center(child: Text("Next", style: whiteText16600)),
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

class CleanTopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top-left
    path.lineTo(0, size.height * 0.45);

    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.55, // control point
      size.width,
      size.height * 0.55, // end point
    );

    // Finish the path at the top-right
    path.lineTo(size.width, 0);
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
            padding: EdgeInsets.only(top: 100),
            child: Image.asset(
              imageAsset,
              height: screenHeight(context) * 0.5,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),

        // Bottom content
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: symmetricPadding(
              context: context,
              horizontalPercent: 20,
              verticalPercent: 30,
            ),
            decoration: const BoxDecoration(
              color: AppColors.lightCreame,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: blackText36600, textAlign: TextAlign.start),
                verticalSpacing(25),
                SizedBox(
                  width: screenWidth(context) * 0.75,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.start,
                      style: greyText16400,
                    ),
                  ),
                ),
                verticalSpacing(80),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
