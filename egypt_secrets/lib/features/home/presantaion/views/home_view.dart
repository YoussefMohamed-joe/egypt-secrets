import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Gap(10),
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.primary,
                  ),
                  const Gap(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: getBodyStyle(color: AppColors.grey),
                      ),
                      const Gap(3),
                      Text(
                        'Abdulrahman',
                        style: getBodyStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: 30,
                        Icons.notifications_none,
                        color: AppColors.white,
                      ))
                ],
              ),
              const Gap(18),
              Text(
                'Discover the most Amazing places',
                style: getBodyStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
              const Gap(15),
              Row(children: [
                Text("Categories",
                    style: getBodyStyle(color: AppColors.white, fontSize: 20)),
                const Spacer(),
                Text("Show all",
                    style:
                        getBodyStyle(color: AppColors.primary, fontSize: 15)),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
