import 'package:egypt_secrets/core/functions/routing.dart';
import 'package:egypt_secrets/core/services/local_storage.dart';
import 'package:egypt_secrets/features/auth/presentation/views/welcome_view.dart';
import 'package:egypt_secrets/features/onboarding/screen1.dart';
import 'package:flutter/material.dart';

class LogoView extends StatefulWidget {
  const LogoView({super.key});

  @override
  State<LogoView> createState() => _LogoViewState();
}

class _LogoViewState extends State<LogoView> {
  bool onBoardingDone = AppLocalStorage.getData('onBoarding') ?? false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (onBoardingDone) {
        navigateTo(context, const WelcomeView());
      } else {
        navigateTo(context, const ScreenView1());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
