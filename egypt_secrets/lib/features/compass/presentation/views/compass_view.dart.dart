import 'package:advanced_search/advanced_search.dart';
import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CompassView extends StatefulWidget {
  const CompassView({super.key});

  @override
  State<CompassView> createState() => _CompassViewState();
}

class _CompassViewState extends State<CompassView> {
  List<String> searchableList = ['Orange', 'Watermelon', 'Banana'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Stack(children: [
                const Gap(10),
                AdvancedSearch(
                  searchItems: searchableList,
                  borderColor: Colors.transparent,
                  maxElementsToDisplay: 7,
                  onItemTap: (value, value2) {},
                  hintText: "Search",
                  searchResultsBgColor: AppColors.textformcolor,
                  hintTextColor: AppColors.white,
                  cursorColor: AppColors.white,
                  focusedBorderColor: Colors.transparent,
                  disabledBorderColor: Colors.transparent,
                  enabledBorderColor: Colors.transparent,
                  borderRadius: 20,
                  inputTextFieldBgColor: AppColors.textformcolor,
                  fontSize: 15,
                  selectedTextColor: AppColors.primary,
                  unSelectedTextColor: AppColors.white,
                ),
                Positioned(
                    top: 12,
                    right: 20,
                    child: Icon(Icons.search, color: AppColors.white))
              ]),
              const Gap(20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: AppColors.semiblack,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: 140,
                          decoration: BoxDecoration(
                            color: AppColors.semiblack,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/demo.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(10),
                                Text(
                                  "Temple of Kom Ombo ",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Gap(5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.grey,
                                      size: 10,
                                    ),
                                    const Gap(3),
                                    Expanded(
                                      child: Text(
                                          "Nagoa Ash Shatb, Markaz Kom Ombo, Aswan",
                                          overflow: TextOverflow.ellipsis,
                                          style: getBodyStyle(
                                              color: AppColors.grey,
                                              fontSize: 8)),
                                    ),
                                  ],
                                ),
                                const Gap(50),
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
                              ]),
                        )
                      ],
                    ),
                  );
                },
                itemCount: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
