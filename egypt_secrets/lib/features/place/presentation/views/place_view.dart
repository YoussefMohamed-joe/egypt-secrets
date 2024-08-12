import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PlaceView extends StatefulWidget {
  const PlaceView({super.key});

  @override
  State<PlaceView> createState() => _PlaceViewState();
}

class _PlaceViewState extends State<PlaceView> {
  bool textVis = false;
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        body: SingleChildScrollView(
          child: SlidingBox(
            minHeight: MediaQuery.of(context).size.height * 0.25,
            maxHeight: MediaQuery.of(context).size.height * 0.45,
            draggableIconBackColor: AppColors.secondary,
            draggableIconColor: AppColors.white,
            color: AppColors.secondary,
            onBoxSlide: (value) {
              if (value == 1) {
                setState(() {
                  textVis = true;
                });
              } else if (value == 0) {
                setState(() {
                  textVis = false;
                });
              }
            },
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  DefaultTabController(
                      length: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ButtonsTabBar(
                              backgroundColor: AppColors.secondary,
                              unselectedBackgroundColor: AppColors.secondary,
                              unselectedLabelStyle: getBodyStyle(
                                  color: AppColors.white, fontSize: 23),
                              labelStyle: getBodyStyle(
                                  color: AppColors.primary, fontSize: 23),
                              tabs: const [
                                Tab(text: 'Description'),
                                Tab(text: 'Reviews'),
                              ],
                            ),
                            const Gap(10),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.24,
                                width: MediaQuery.of(context).size.width,
                                child: TabBarView(children: [
                                  Text(
                                    "Kom Ombo is one of the more unusual temples in Egypt. Due to the conflict between Sobek and Horus, the ancient Egyptians felt it necessary to separate their temple spaces within one temple. The Kom Ombo temple has two entrances, two courts, two colonnades, two Hypostyle halls and two sanctuaries, one side for each god. Kom Ombo is one of the more unusual temples in Egypt. Due to the conflict between Sobek and Horus, the ancient Egyptians felt it necessary to separate their temple spaces within one temple. The Kom Ombo temple has two entrances, two courts, two colonnades, two Hypostyle halls and two sanctuaries, one side for each god. Kom Ombo is one of the more unusual temples in Egypt. Due to the conflict between Sobek and Horus, the ancient Egyptians felt it necessary to separate their temple spaces within one temple. The Kom Ombo temple has two entrances, two courts, two colonnades, two Hypostyle halls and two sanctuaries, one side for each god. ",
                                    style: getBodyStyle(
                                      fontSize: 10,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  ListView.builder(
                                    itemBuilder: (context, index) => Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.semitrans),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      AppColors.primary,
                                                  child: Image.asset(
                                                    'assets/images/user.png',
                                                  ),
                                                ),
                                                const Gap(8),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Abdulrahman',
                                                      style: getBodyStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 12),
                                                    ),
                                                    const Gap(3),
                                                    Text(
                                                      '1d',
                                                      style: getBodyStyle(
                                                          color: AppColors.grey,
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Gap(15),
                                            Text(
                                              "This is a nice place",
                                              style: getBodyStyle(
                                                  fontSize: 12,
                                                  color: AppColors.white),
                                            )
                                          ]),
                                    ),
                                    itemCount: 5,
                                  )
                                ])),
                          ])),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        'Book Now',
                        style: getBodyStyle(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            collapsed: true,
            collapsedBody: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    "Temple of Kom Ombo dedicated to God Sobek on the Nile River near Aswan and Luxor",
                    style: getTitleStyle(fontSize: 16, color: AppColors.white),
                  ).animate().slideY(begin: -0.5, end: 0, duration: 500.ms),
                  const Gap(10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.grey,
                        size: 10,
                      ),
                      const Gap(3),
                      Text("Nagoa Ash Shatb, Markaz Kom Ombo, Aswan",
                          overflow: TextOverflow.ellipsis,
                          style:
                              getBodyStyle(color: AppColors.grey, fontSize: 9)),
                      const Gap(30),
                      Icon(Icons.star, color: AppColors.primary, size: 15),
                      const Gap(3),
                      Text("4.5",
                          style: getBodyStyle(
                              color: AppColors.white, fontSize: 12)),
                      const Gap(3),
                      Text(
                        "(1440)",
                        style:
                            getBodyStyle(color: AppColors.grey, fontSize: 10),
                      ),
                      const Spacer(),
                      Text("\$60",
                          style: getBodyStyle(
                              color: AppColors.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      const Gap(3),
                      Text("/Day",
                          style: getBodyStyle(
                              color: AppColors.grey, fontSize: 10)),
                    ],
                  ).animate().slideY(begin: -0.5, end: 0, duration: 500.ms),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        'Book Now',
                        style: getBodyStyle(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ).animate().slideY(begin: -0.5, end: 0),
                ],
              ),
            ),
            backdrop: Backdrop(
              body: Column(
                children: [
                  Stack(children: [
                    CarouselSlider.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  color: AppColors.semiblack,
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/placedemo.png"),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.75,
                          viewportFraction: 1,
                          autoPlayInterval: const Duration(seconds: 2),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          onPageChanged: (index, reason) {
                            setState(() {
                              page = index;
                            });
                          },
                          autoPlay: false,
                          scrollDirection: Axis.horizontal,
                        )),
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
                      bottom: 10,
                      left: 100,
                      child: SmoothPageIndicator(
                        controller: PageController(initialPage: page),
                        count: 4,
                        effect: WormEffect(
                            activeDotColor: AppColors.white,
                            dotColor: AppColors.semitrans,
                            dotHeight: 8,
                            dotWidth: 55),
                      ),
                    ),
                    Positioned(
                        bottom: 155,
                        left: 24,
                        right: 70,
                        child: textVis
                            ? Column(children: [
                                Text(
                                  "Temple of Kom Ombo dedicated to God Sobek on the Nile River near Aswan and Luxor",
                                  style: getTitleStyle(
                                      fontSize: 16, color: AppColors.white),
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.grey,
                                      size: 10,
                                    ),
                                    const Gap(3),
                                    Text(
                                        "Nagoa Ash Shatb, Markaz Kom Ombo, Aswan",
                                        overflow: TextOverflow.ellipsis,
                                        style: getBodyStyle(
                                            color: AppColors.grey,
                                            fontSize: 9)),
                                    const Spacer(),
                                    Icon(Icons.star,
                                        color: AppColors.primary, size: 15),
                                    const Gap(3),
                                    Text("4.5",
                                        style: getBodyStyle(
                                            color: AppColors.white,
                                            fontSize: 12)),
                                    const Gap(3),
                                    Text(
                                      "(1440)",
                                      style: getBodyStyle(
                                          color: AppColors.grey, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ]).animate().slideY(begin: 0.5, end: 0)
                            : const SizedBox()),
                    Positioned(
                        bottom: 155,
                        right: 20,
                        child: textVis
                            ? Column(children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: AppColors.white,
                                      size: 30,
                                    )),
                                const Gap(10),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.map_outlined,
                                      color: AppColors.white,
                                      size: 30,
                                    )),
                                const Gap(10),
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      SvgPicture.asset("assets/icons/chat.svg"),
                                  iconSize: 30,
                                ),
                                const Gap(10),
                                IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/icons/share.svg"),
                                  iconSize: 30,
                                ),
                              ]).animate().slideY(begin: 0.5, end: 0)
                            : const SizedBox()),
                    Positioned(
                        bottom: 30,
                        right: 20,
                        child: !textVis
                            ? Column(children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: AppColors.white,
                                      size: 30,
                                    )),
                                const Gap(15),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.map_outlined,
                                      color: AppColors.white,
                                      size: 30,
                                    )),
                                const Gap(15),
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      SvgPicture.asset("assets/icons/chat.svg"),
                                  iconSize: 30,
                                ),
                                const Gap(15),
                                IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/icons/share.svg"),
                                  iconSize: 30,
                                ),
                              ]).animate().slideY(begin: -0.5, end: 0)
                            : const SizedBox())
                  ]),
                ],
              ),
            ),
          ),
        ));
  }
}
