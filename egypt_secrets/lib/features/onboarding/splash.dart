import 'package:egypt_secrets/core/functions/routing.dart';
import 'package:egypt_secrets/core/services/local_storage.dart';
import 'package:egypt_secrets/core/widgets/nav_bar_view.dart';
import 'package:egypt_secrets/features/auth/presentation/manager/auth_cubit.dart';
import 'package:egypt_secrets/features/auth/presentation/views/welcome_view.dart';
import 'package:egypt_secrets/features/onboarding/screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoView extends StatefulWidget {
  const LogoView({super.key});

  @override
  State<LogoView> createState() => _LogoViewState();
}

class _LogoViewState extends State<LogoView> {
  bool onBoardingDone = AppLocalStorage.getData('onBoarding') ?? false;
  bool loginDone = AppLocalStorage.getData('token') == null ? false : true;
  @override
  void initState() {
    context.read<AuthCubit>().getProfile();
    Future.delayed(const Duration(seconds: 3), () {
      if (onBoardingDone) {
        if (loginDone) {
          navigateToWithReplacment(context, const NavBar());
        } else {
          navigateToWithReplacment(context, const WelcomeView());
        }
      } else {
        navigateToWithReplacment(context, const ScreenView1());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
