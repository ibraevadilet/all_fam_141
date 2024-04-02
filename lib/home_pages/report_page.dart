import 'package:all_fam_141/content/cubit/load_data_cubit.dart';
import 'package:all_fam_141/content/transaction_hive_model/transaction_hive_model.dart';
import 'package:all_fam_141/home_pages/budget_page.dart';
import 'package:all_fam_141/main.dart';
import 'package:all_fam_141/pages/unlim_pafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool isasdfasf = false;

  @override
  void initState() {
    isasdfasf = affaafaf.getBool('sdfdsfsdf') ?? false;
    super.initState();
  }

  String transactionType = 'Income';

  String period = '1m';
  String category = 'All';

  List<TransactionHiveModel> trList = [];
  List<TransactionHiveModel> allData = [];

  int totalSummIncome = 0;
  int totalSummOut = 0;

  int salarySumm = 0;
  int dividentSumm = 0;
  int freelanceSumm = 0;
  int otherSummIncom = 0;

  int foodSumm = 0;
  int rentSumm = 0;
  int educSumm = 0;
  int otherSummExpen = 0;

  initData() {
    totalSummIncome = 0;
    salarySumm = 0;
    dividentSumm = 0;
    freelanceSumm = 0;
    otherSummIncom = 0;

    totalSummOut = 0;
    foodSumm = 0;
    rentSumm = 0;
    educSumm = 0;
    otherSummExpen = 0;

    allData = List.from(trHive.values.toList());

    for (var e in allData.where((e) => e.transactionType == 'Income')) {
      totalSummIncome += e.amount;
    }

    for (var e in allData.where((e) => e.category == 'Salary')) {
      salarySumm += e.amount;
    }
    for (var e in allData.where((e) => e.category == 'Dividents')) {
      dividentSumm += e.amount;
    }
    for (var e in allData.where((e) => e.category == 'Freelance')) {
      freelanceSumm += e.amount;
    }
    for (var e in allData.where(
      (e) => e.category == 'Other' && e.transactionType == 'Income',
    )) {
      otherSummIncom += e.amount;
    }

    for (var e in allData.where((e) => e.transactionType == 'Expense')) {
      totalSummOut += e.amount;
    }

    for (var e in allData.where((e) => e.category == 'Food')) {
      foodSumm += e.amount;
    }
    for (var e in allData.where((e) => e.category == 'Rent')) {
      rentSumm += e.amount;
    }
    for (var e in allData.where((e) => e.category == 'Education')) {
      educSumm += e.amount;
    }
    for (var e in allData.where(
      (e) => e.category == 'Other' && e.transactionType == 'Expense',
    )) {
      otherSummExpen += e.amount;
    }

    filterData();
  }

  filterData() {
    trList = List.from(trHive.values.toList());
    trList.removeWhere((e) => e.transactionType != transactionType);

    if (category != 'All') {
      trList.removeWhere((e) => e.category != category);
    }

    if (period == '1m') {
      trList.removeWhere(
        (e) => e.date.difference(DateTime.now()).inDays.abs() > 30,
      );
    } else if (period == '3m') {
      trList.removeWhere(
        (e) => e.date.difference(DateTime.now()).inDays.abs() > 90,
      );
    } else if (period == '6m') {
      trList.removeWhere(
        (e) => e.date.difference(DateTime.now()).inDays.abs() > 180,
      );
    } else if (period == '1y') {
      trList.removeWhere(
        (e) => e.date.difference(DateTime.now()).inDays.abs() > 365,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadDataCubit, LoadDataState>(
      builder: (context, state) {
        initData();
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              transactionType = 'Income';
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: transactionType == 'Income'
                                  ? const Color(0xff65FA7E)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              'Income',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF-Pro',
                                color: transactionType == 'Income'
                                    ? Colors.black
                                    : const Color(0xff555555),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              transactionType = 'Expense';
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: transactionType == 'Expense'
                                  ? const Color(0xffFA6565)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              'Expense',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF-Pro',
                                color: transactionType == 'Expense'
                                    ? Colors.black
                                    : const Color(0xff555555),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  transactionType == 'Income'
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Image.asset(
                                'assets/images/EllipseIcon.png',
                              ),
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Total Income',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SF-Pro',
                                    color: Color(0xff555555),
                                  ),
                                ),
                                Text(
                                  '\$ $totalSummIncome',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'SF-Pro',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: StackContainer(
                                summ: salarySumm,
                                type: 'Salary',
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: StackContainer(
                                summ: dividentSumm,
                                type: 'Dividents',
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: StackContainer(
                                summ: freelanceSumm,
                                type: 'Freelance',
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: StackContainer(
                                summ: otherSummIncom,
                                type: 'Other',
                              ),
                            ),
                          ],
                        )
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Image.asset(
                                'assets/images/EllipseIcon.png',
                                color: const Color(0xffFA6565),
                              ),
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Total Outcome',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SF-Pro',
                                    color: Color(0xff555555),
                                  ),
                                ),
                                Text(
                                  '\$ $totalSummOut',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'SF-Pro',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: StackContainer(
                                isInc: false,
                                summ: foodSumm,
                                type: 'Food',
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: StackContainer(
                                isInc: false,
                                summ: rentSumm,
                                type: 'Rent',
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: StackContainer(
                                isInc: false,
                                summ: educSumm,
                                type: 'Education',
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: StackContainer(
                                isInc: false,
                                summ: otherSummExpen,
                                type: 'Other',
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      AutoPaymantWidgety(
                        onTap: () {
                          period = '1m';
                          setState(() {});
                        },
                        type: '1m',
                        isActive: period == '1m',
                      ),
                      AutoPaymantWidgety(
                        onTap: () {
                          period = '3m';
                          setState(() {});
                        },
                        type: '3m',
                        isActive: period == '3m',
                      ),
                      AutoPaymantWidgety(
                        onTap: () {
                          if (isasdfasf) {
                            period = '6m';
                            setState(() {});
                          } else {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    const UnlimPafe(sdasd: true),
                              ),
                            );
                          }
                        },
                        type: '6m',
                        isActive: period == '6m',
                      ),
                      AutoPaymantWidgety(
                        onTap: () {
                          if (isasdfasf) {
                            period = '1y';
                            setState(() {});
                          } else {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    const UnlimPafe(sdasd: true),
                              ),
                            );
                          }
                        },
                        type: '1y',
                        isActive: period == '1y',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: transactionType == 'Income'
                        ? Row(
                            children: [
                              AutoPaymantWidgety(
                                isExpanded: false,
                                vertical: 10,
                                onTap: () {
                                  category = 'All';
                                  filterData();
                                  setState(() {});
                                },
                                type: 'All',
                                isActive: category == 'All',
                              ),
                              AutoPaymantWidgety(
                                isExpanded: false,
                                vertical: 10,
                                onTap: () {
                                  category = 'Salary';
                                  setState(() {});
                                },
                                type: 'Salary',
                                isActive: category == 'Salary',
                              ),
                              AutoPaymantWidgety(
                                isExpanded: false,
                                vertical: 10,
                                onTap: () {
                                  category = 'Dividents';
                                  setState(() {});
                                },
                                type: 'Dividents',
                                isActive: category == 'Dividents',
                              ),
                              AutoPaymantWidgety(
                                isExpanded: false,
                                vertical: 10,
                                onTap: () {
                                  category = 'Freelance';
                                  setState(() {});
                                },
                                type: 'Freelance',
                                isActive: category == 'Freelance',
                              ),
                              AutoPaymantWidgety(
                                isExpanded: false,
                                vertical: 10,
                                onTap: () {
                                  category = 'Other';
                                  setState(() {});
                                },
                                type: 'Other',
                                isActive: category == 'Other',
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              AutoPaymantWidgety(
                                isExpanded: false,
                                vertical: 10,
                                onTap: () {
                                  category = 'All';

                                  setState(() {});
                                },
                                type: 'All',
                                isActive: category == 'All',
                              ),
                              AutoPaymantWidgety(
                                isExpanded: false,
                                vertical: 10,
                                onTap: () {
                                  category = 'Food';

                                  setState(() {});
                                },
                                type: 'Food',
                                isActive: category == 'Food',
                              ),
                              AutoPaymantWidgety(
                                isExpanded: false,
                                vertical: 10,
                                onTap: () {
                                  category = 'Rent';

                                  setState(() {});
                                },
                                type: 'Rent',
                                isActive: category == 'Rent',
                              ),
                              AutoPaymantWidgety(
                                isExpanded: false,
                                vertical: 10,
                                onTap: () {
                                  category = 'Education';

                                  setState(() {});
                                },
                                type: 'Education',
                                isActive: category == 'Education',
                              ),
                              AutoPaymantWidgety(
                                isExpanded: false,
                                vertical: 10,
                                onTap: () {
                                  category = 'Other';

                                  setState(() {});
                                },
                                type: 'Other',
                                isActive: category == 'Other',
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 20),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: trList.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) => Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    trList[index].category,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'SF-Pro',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('HH:mm a')
                                        .format(trList[index].date),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'SF-Pro',
                                      color: Color(0xff555555),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '\$ ${trList[index].amount}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'SF-Pro',
                                color: Color(0xff65FA7E),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(
                          color: Color(0xff202020),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class StackContainer extends StatelessWidget {
  const StackContainer({
    super.key,
    required this.summ,
    required this.type,
    this.isInc = true,
  });

  final int summ;
  final String type;
  final bool isInc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xff131313).withOpacity(0.6),
          border: Border.all(
            color: const Color(0xff303030),
            width: 1,
          )),
      child: Column(
        children: [
          Text(
            '\$ $summ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'SF-Pro',
              color: isInc ? const Color(0xff65FA7E) : const Color(0xffFA6565),
            ),
          ),
          Text(
            type,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF-Pro',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
