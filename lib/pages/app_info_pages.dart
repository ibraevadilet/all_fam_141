import 'package:all_fam_141/main.dart';
import 'package:all_fam_141/pages/unlim_pafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppInfoPages extends StatefulWidget {
  const AppInfoPages({super.key});
  @override
  State<AppInfoPages> createState() => _AppInfoPagesState();
}

class _AppInfoPagesState extends State<AppInfoPages> {
  final smController = PageController();
  int sdfsd = 0;

  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;

  @override
  void initState() {
    super.initState();
    image1 = Image.asset(
      'assets/images/image1.png',
      alignment: Alignment.topCenter,
    );
    image2 = Image.asset(
      'assets/images/image2.png',
      alignment: Alignment.topCenter,
    );
    image3 = Image.asset(
      'assets/images/image3.png',
      alignment: Alignment.topCenter,
    );
    image4 = Image.asset(
      'assets/images/image4.png',
      alignment: Alignment.topCenter,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/pageBG.png',
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Expanded(
                            child: PageView(
                              onPageChanged: (value) {
                                sdfsd = value;
                              },
                              controller: smController,
                              children: [
                                AERGswrwe(
                                  image: image1,
                                  title: 'Add Income',
                                  desk:
                                      'Distribute it by category, amount of money, date and name of the person who has the income.',
                                ),
                                AERGswrwe(
                                  image: image2,
                                  title: 'Add Expense',
                                  desk:
                                      'Distribute it by category, amount of money, date and name of the person who has the outcome.',
                                ),
                                AERGswrwe(
                                  image: image3,
                                  title: 'Use saving tips',
                                  desk:
                                      'We have collected more than 10+ tips on saving and investing',
                                ),
                                AERGswrwe(
                                  image: image4,
                                  title: 'Follow the statistics',
                                  desk:
                                      'Monitor income and expense statistics, filter them by periods and categories',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              SmoothPageIndicator(
                                controller: smController,
                                count: 4,
                                effect: ExpandingDotsEffect(
                                  activeDotColor: Colors.white,
                                  expansionFactor: 5,
                                  dotWidth: 10,
                                  dotHeight: 10,
                                  dotColor: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () async {
                                  if (sdfsd == 3) {
                                    await affaafaf.setBool('sdfsfdd', true);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => const UnlimPafe(),
                                      ),
                                      (pred) => false,
                                    );
                                  } else {
                                    smController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  }
                                },
                                child: Image.asset(
                                  'assets/images/nextIcon.png',
                                  height: 62.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 36.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}

class AERGswrwe extends StatelessWidget {
  const AERGswrwe({
    super.key,
    required this.image,
    required this.title,
    required this.desk,
  });

  final Widget image;
  final String title;
  final String desk;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image,
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'SF-Pro',
            color: Colors.white,
          ),
        ),
        Text(
          desk,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF-Pro',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
