import 'package:egypt_secrets/core/services/local_storage.dart';
import 'package:egypt_secrets/features/auth/presentation/manager/auth_cubit.dart';
import 'package:egypt_secrets/features/onboarding/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogoView(),
      ),
    );
  }
}
