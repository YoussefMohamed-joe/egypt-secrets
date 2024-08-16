import 'package:egypt_secrets/core/functions/email_validation.dart';
import 'package:egypt_secrets/core/functions/routing.dart';
import 'package:egypt_secrets/core/services/local_storage.dart';
import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:egypt_secrets/core/widgets/nav_bar_view.dart';
import 'package:egypt_secrets/features/auth/presentation/manager/auth_cubit.dart';
import 'package:egypt_secrets/features/auth/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool passvis = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        body: SingleChildScrollView(
          child: BlocListener<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
                navigatepop(context);
              } else if (state is LoginSuccessState) {
                AppLocalStorage.cashData(
                    'token', state.postAuthResponse.data!.token);
                navigateToWithReplacment(context, const NavBar());
              } else if (state is LoginLoadingState) {
                showDialog(
                    context: context,
                    builder: (context) => Center(
                            child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(AppColors.primary),
                        )));
              }
            },
            child: Form(
              key: formKey,
              child: Column(children: [
                Stack(children: [
                  Container(
                    height: 0.45 * MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/login.png'),
                          fit: BoxFit.cover,
                        )),
                  ).animate().fadeIn(duration: 600.ms),
                  Positioned(
                    top: 60,
                    left: 24,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60)),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 24,
                    child: Text(
                      "Log in",
                      style: getTitleStyle(
                          color: AppColors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ).animate().moveY(begin: 30, duration: 500.ms),
                  )
                ]),
                Container(
                    height: 0.55 * MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email",
                                  style: getBodyStyle(
                                    color: AppColors.white,
                                  )),
                              const Gap(5),
                              SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: TextFormField(
                                  controller: emailController,
                                  style: getBodyStyle(color: AppColors.white),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    } else if (emailValidate(
                                            emailController.text) ==
                                        false) {
                                      return 'Please Enter Valid Email';
                                    }
                                    return null;
                                  },
                                  cursorColor: AppColors.primary,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 15.0),
                                    filled: true,
                                    fillColor: AppColors.textformcolor,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: AppColors.primary),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Text("Password",
                                  style: getBodyStyle(
                                    color: AppColors.white,
                                  )),
                              const Gap(5),
                              SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: TextFormField(
                                  controller: passwordController,
                                  style: getBodyStyle(color: AppColors.white),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Password';
                                    } else if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                  cursorColor: AppColors.primary,
                                  obscureText: passvis,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 15.0),
                                    filled: true,
                                    fillColor: AppColors.textformcolor,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: AppColors.primary),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            passvis = !passvis;
                                          });
                                        },
                                        icon: Icon(
                                          passvis
                                              ? Icons.visibility_off
                                              : Icons.remove_red_eye,
                                          color: AppColors.primary,
                                        )),
                                  ),
                                ),
                              ),
                              const Gap(5),
                              Text(
                                "Forgot your password ?",
                                style: getBodyStyle(
                                    color: AppColors.primary, fontSize: 12),
                              ),
                              const Gap(60),
                              SizedBox(
                                height: 55,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().login(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  child: Text(
                                    'Log in',
                                    style: getBodyStyle(
                                        color: AppColors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const Gap(20),
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  "or",
                                  style: getBodyStyle(
                                      color: AppColors.primary, fontSize: 12),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ]),
                              const Gap(20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/fga.png"),
                                ],
                              ),
                            ]).animate().moveY(begin: 40, duration: 500.ms),
                      ),
                    ))
              ]),
            ),
          ),
        ));
  }
}
