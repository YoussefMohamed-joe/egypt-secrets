import 'package:egypt_secrets/core/services/local_storage.dart';
import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:egypt_secrets/features/auth/presentation/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenView3 extends StatelessWidget {
  const ScreenView3({super.key});

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
                image: AssetImage('assets/images/image 3.png'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ready to unlock Egypt\'s magic? Let\'s get started!',
                    style: getTitleStyle(color: AppColors.white),
                  ),
                  const Gap(20),
                  Text(
                    'Uncover the magic of Egypt. Start exploring!',
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
                        initialPage: 2,
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
                          AppLocalStorage.cashData("onBoarding", true);
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                alignment: Alignment.bottomCenter,
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 600),
                                reverseDuration:
                                    const Duration(milliseconds: 600),
                                type: PageTransitionType.rightToLeftJoined,
                                child: const WelcomeView(),
                                childCurrent: const ScreenView3()),
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
