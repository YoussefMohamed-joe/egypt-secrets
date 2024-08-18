import 'package:egypt_secrets/core/functions/routing.dart';
import 'package:egypt_secrets/core/services/local_storage.dart';
import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:egypt_secrets/core/widgets/custom_btn.dart';
import 'package:egypt_secrets/features/auth/presentation/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Gap(40),
            Row(
              children: [
                // IMAGE
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.white,
                  backgroundImage: const AssetImage('assets/images/user.png'),
                ),

                const Gap(20),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NAME
                    Text(
                      'User',
                      style: getTitleStyle(color: AppColors.white),
                    ),
                    // EMAIL
                    Text(
                      'User@email.com',
                      style: getBodyStyle(color: AppColors.white),
                    ),

                    const Gap(5)
                  ],
                )),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                backgroundColor: AppColors.secondary,
                                title: Text(
                                  'Are you sure you want to log out?',
                                  style: getBodyStyle(
                                      fontSize: 18, color: AppColors.white),
                                ),
                                content: Row(children: [
                                  Expanded(
                                    child: CustomButton(
                                      onPressed: () {
                                        AppLocalStorage.removeData('token');

                                        navigateAndRemoveUntil(
                                            context, const WelcomeView());
                                      },
                                      text: 'Yes',
                                    ),
                                  ),
                                  const Gap(10),
                                  Expanded(
                                    child: CustomButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        text: 'Cancel'),
                                  ),
                                ]));
                          });
                    },
                    icon: Icon(Icons.logout, color: AppColors.primary)),
              ],
            ),
            const Gap(20),
            Divider(
              color: AppColors.primary,
              endIndent: 20,
              indent: 20,
            ),
            const Gap(10),
            Card(
              color: AppColors.textformcolor,
              elevation: 20,
              shadowColor: AppColors.grey.withOpacity(.3),
              child: ListTile(
                onTap: () {},
                tileColor: AppColors.textformcolor,
                title: Text(
                  'My Orders',
                  style: getBodyStyle(color: AppColors.white),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: AppColors.primary,
                ),
              ),
            ),
            const Gap(18),
            Card(
              color: AppColors.textformcolor,
              elevation: 20,
              shadowColor: AppColors.grey.withOpacity(.3),
              child: ListTile(
                onTap: () {},
                tileColor: AppColors.textformcolor,
                title: Text(
                  'Edit Profile',
                  style: getBodyStyle(color: AppColors.white),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: AppColors.primary,
                ),
              ),
            ),
            const Gap(18),
            Card(
              color: AppColors.textformcolor,
              elevation: 20,
              shadowColor: AppColors.grey.withOpacity(.3),
              child: ListTile(
                onTap: () {},
                tileColor: AppColors.textformcolor,
                title: Text(
                  'Reset Password',
                  style: getBodyStyle(color: AppColors.white),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: AppColors.primary,
                ),
              ),
            ),
            const Gap(18),
            Card(
              color: AppColors.textformcolor,
              elevation: 20,
              shadowColor: AppColors.grey.withOpacity(.3),
              child: ListTile(
                onTap: () {},
                tileColor: AppColors.textformcolor,
                title: Text(
                  'Contact Us',
                  style: getBodyStyle(color: AppColors.white),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: AppColors.primary,
                ),
              ),
            ),
            const Gap(18),
            Card(
              color: AppColors.textformcolor,
              elevation: 20,
              shadowColor: AppColors.grey.withOpacity(.3),
              child: ListTile(
                onTap: () {},
                tileColor: AppColors.textformcolor,
                title: Text(
                  'About Us',
                  style: getBodyStyle(color: AppColors.white),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: AppColors.primary,
                ),
              ),
            ),
            const Gap(18),
            Card(
              color: AppColors.textformcolor,
              elevation: 20,
              shadowColor: AppColors.grey.withOpacity(.3),
              child: ListTile(
                onTap: () {},
                tileColor: AppColors.textformcolor,
                title: Text(
                  'Terms & Conditions',
                  style: getBodyStyle(color: AppColors.white),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
