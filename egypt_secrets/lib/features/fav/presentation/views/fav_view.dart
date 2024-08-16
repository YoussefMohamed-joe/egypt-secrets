import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:egypt_secrets/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(children: [
                Text('Favourits',
                    style: getTitleStyle(fontSize: 30, color: AppColors.white)),
                const Gap(25),
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
                                  const Gap(35),
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
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete_outlined,
                                          color: AppColors.primary,
                                        ),
                                      )
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
              ]),
            ),
          ),
        ));
  }
}
