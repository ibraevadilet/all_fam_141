import 'package:all_fam_141/content/cubit/load_data_cubit.dart';
import 'package:all_fam_141/home_pages/budget_page.dart';
import 'package:all_fam_141/home_pages/report_page.dart';
import 'package:all_fam_141/home_pages/settings_page.dart';
import 'package:all_fam_141/home_pages/tips_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BotChangeScreen extends StatefulWidget {
  const BotChangeScreen({super.key});
  @override
  State<BotChangeScreen> createState() => _BotChangeScreenState();
}

class _BotChangeScreenState extends State<BotChangeScreen> {
  int currPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currPage,
        children: afdfsfsdsss,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: const Color(0xff131313),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: const Color(0xff303030),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => setState(() => currPage = 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 29),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: currPage == 0
                          ? const Color(0xffD2FA65)
                          : const Color(0xff131313),
                    ),
                    child: Image.asset(
                      'assets/images/b1.png',
                      color: currPage == 0 ? Colors.black : null,
                      width: 24.h,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    currPage = 1;
                    context.read<LoadDataCubit>().load();
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 29),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: currPage == 1
                          ? const Color(0xffD2FA65)
                          : const Color(0xff131313),
                    ),
                    child: Image.asset(
                      'assets/images/b2.png',
                      color: currPage == 1 ? Colors.black : null,
                      width: 24.h,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => setState(() => currPage = 2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 29),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: currPage == 2
                          ? const Color(0xffD2FA65)
                          : const Color(0xff131313),
                    ),
                    child: Image.asset(
                      'assets/images/b3.png',
                      color: currPage == 2 ? Colors.black : null,
                      width: 24.h,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => setState(() => currPage = 3),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 29),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: currPage == 3
                          ? const Color(0xffD2FA65)
                          : const Color(0xff131313),
                    ),
                    child: Image.asset(
                      'assets/images/b4.png',
                      color: currPage == 3 ? Colors.black : null,
                      width: 24.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> afdfsfsdsss = [
  const BudgetPage(),
  const ReportPage(),
  const TipsPage(),
  const SettingsPage(),
];
