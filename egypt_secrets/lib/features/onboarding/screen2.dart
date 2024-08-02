import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:egypt_secrets/features/onboarding/screen3.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenView2 extends StatelessWidget {
  const ScreenView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image 2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 140,
              left: 90,
              right: 90,
              child: Text(
                'Egypt\nSecrets',
                textAlign: TextAlign.center,
                style: getHeaderStyle(),
              )),
          Positioned(
              bottom: 110,
              left: 24,
              right: 24,
              child: Column(
                children: [
                  Text(
                    'Discover Egypt\'s breathtaking sights with our all-in-one travel app!',
                    style: getTitleStyle(color: AppColors.white),
                  ),
                  const Gap(15),
                  Text(
                    'you can see best touristic places and hotels that can help you to create unforgettable memories!',
                    style: getBodyStyle(color: AppColors.grey, fontSize: 12),
                  )
                ],
              )),
          Positioned(
              bottom: 30,
              left: 24,
              right: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                      controller: PageController(
                        initialPage: 1,
                      ),
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.white,
                        dotColor: AppColors.secondary,
                        dotHeight: 10,
                        dotWidth: 12,
                      ),
                      count: 3),
                  const Spacer(),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(60)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                alignment: Alignment.bottomCenter,
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 800),
                                reverseDuration:
                                    const Duration(milliseconds: 600),
                                type: PageTransitionType.fade,
                                child: const ScreenView3(),
                                childCurrent: const ScreenView2()),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: AppColors.black,
                        )),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
