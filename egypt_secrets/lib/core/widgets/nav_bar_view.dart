import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/features/Profile/presentation/views/profile_view.dart';
import 'package:egypt_secrets/features/compass/presentation/views/compass_view.dart.dart';
import 'package:egypt_secrets/features/fav/presentation/views/fav_view.dart';
import 'package:egypt_secrets/features/home/presantaion/views/home_view.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    //context.read<OrgCubit>().getOrg();
    super.initState();
  }

  int currenindex = 0;
  List<Widget> views = [
    const HomeView(),
    const CompassView(),
    const FavView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        views[currenindex],
        Positioned(
          bottom: -5,
          left: 15,
          right: 15,
          child: SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: FloatingNavbar(
              selectedBackgroundColor: AppColors.secondary,
              selectedItemColor: AppColors.primary,
              borderRadius: 15,
              itemBorderRadius: 15,
              backgroundColor: AppColors.black,
              onTap: (int val) {
                setState(() {
                  currenindex = val;
                });
              },
              currentIndex: currenindex,
              iconSize: 27,
              items: [
                FloatingNavbarItem(icon: Icons.home_rounded),
                FloatingNavbarItem(icon: Icons.explore_outlined),
                FloatingNavbarItem(icon: Icons.favorite_outline),
                FloatingNavbarItem(icon: Icons.person_outline),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
