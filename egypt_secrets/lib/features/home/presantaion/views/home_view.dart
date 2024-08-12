import 'package:egypt_secrets/core/functions/routing.dart';
import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:egypt_secrets/features/place/presentation/views/place_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> icons = [
    'assets/icons/Temple.svg',
    'assets/icons/beach.svg',
    'assets/icons/camping.svg',
    'assets/icons/mount.svg',
  ];

  List<String> titles = [
    'Temple',
    'Beach',
    'Camping',
    'Mount',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.primary,
                    child: Image.asset('assets/images/user.png'),
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
              const Gap(10),
              SizedBox(
                height: 70,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(children: [
                      SvgPicture.asset(icons[index], height: 40),
                      const Gap(5),
                      Text(
                        titles[index],
                        style: getBodyStyle(color: AppColors.white),
                      ),
                    ]);
                  },
                  separatorBuilder: (context, index) {
                    return const Gap(60);
                  },
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const Gap(15),
              Text("Popular places",
                  style: getBodyStyle(color: AppColors.white, fontSize: 20)),
              const Gap(15),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      navigateTo(context, const PlaceView());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Stack(children: [
                        Container(
                          height: 280,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/demo.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                            top: 15,
                            left: 15,
                            right: 25,
                            child: Row(children: [
                              Icon(Icons.star,
                                  color: AppColors.primary, size: 20),
                              const Gap(5),
                              Text("4.5",
                                  style: getBodyStyle(color: AppColors.white)),
                              const Spacer(),
                              Icon(
                                Icons.bookmark,
                                color: AppColors.primary,
                                size: 27,
                              )
                            ])),
                        Positioned(
                            bottom: 13,
                            left: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Temple of Kom Ombo ",
                                    style: getTitleStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 22)),
                                const Gap(3),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.grey,
                                      size: 15,
                                    ),
                                    const Gap(3),
                                    Text(
                                        "Nagoa Ash Shatb, Markaz Kom Ombo, Aswan",
                                        style: getBodyStyle(
                                            color: AppColors.grey,
                                            fontSize: 12)),
                                  ],
                                ),
                                const Gap(8),
                                Row(
                                  children: [
                                    Text("\$60",
                                        style: getBodyStyle(
                                            color: AppColors.primary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    const Gap(3),
                                    Text("/Day",
                                        style: getBodyStyle(
                                            color: AppColors.grey,
                                            fontSize: 10)),
                                  ],
                                )
                              ],
                            ))
                      ]),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
