import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:egypt_secrets/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/images/welcome.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  )),
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
              bottom: 50,
              left: 24,
              right: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 500),
                              reverseDuration:
                                  const Duration(milliseconds: 500),
                              type: PageTransitionType.fade,
                              child: const LoginView(),
                              childCurrent: const WelcomeView()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        'Log in',
                        style: getBodyStyle(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: AppColors.primary),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        'Sign up',
                        style: getBodyStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
