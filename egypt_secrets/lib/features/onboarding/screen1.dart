import 'package:egypt_secrets/core/functions/routing.dart';
import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:egypt_secrets/features/onboarding/screen2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenView1 extends StatelessWidget {
  const ScreenView1({super.key});

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
                image: AssetImage('assets/images/image 1.png'),
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
                    'Unforgettable adventures await! Welcome to Egypt Secrets, your Egyptian travel companion',
                    style: getTitleStyle(color: AppColors.white),
                  ),
                  const Gap(10),
                  Text(
                    'Unlock the magic of Egypt - discover breathtaking sights & local favorites with our app!',
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
                        initialPage: 0,
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
                                child: const ScreenView2(),
                                childCurrent: const ScreenView1()),
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
