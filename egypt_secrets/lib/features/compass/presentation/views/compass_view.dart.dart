import 'package:advanced_search/advanced_search.dart';
import 'package:egypt_secrets/core/utils/colors.dart';
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
                itemBuilder: (context, index) {
                  return const Gap(10);
                },
                itemCount: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
