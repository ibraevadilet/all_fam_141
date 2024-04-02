import 'package:all_fam_141/content/transaction_hive_model/transaction_hive_model.dart';
import 'package:all_fam_141/main.dart';
import 'package:all_fam_141/pages/unlim_pafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  String transactionType = 'Income';
  String autoPaymant = 'Day';
  String category = 'Other';
  String name = '';
  String amount = '';
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  bool get isAllSaved => name.isNotEmpty && amount.isNotEmpty;

  bool isasdfasf = false;

  @override
  void initState() {
    isasdfasf = affaafaf.getBool('sdfdsfsdf') ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: !isAllSaved
            ? null
            : InkWell(
                onTap: () async {
                  await trHive.add(
                    TransactionHiveModel(
                      transactionType: transactionType,
                      name: name,
                      amount: int.parse(amount),
                      autoPaymantType: autoPaymant,
                      category: category,
                      date: DateTime.now(),
                    ),
                  );
                  setState(() {
                    name = '';
                    amount = '';
                    nameController.clear();
                    amountController.clear();
                  });
                  final currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      content: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF26D72C),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'Success saved',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SF-Pro',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: IntrinsicWidth(
                  child: IntrinsicHeight(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: transactionType == 'Expense'
                            ? const Color(0xffFA6565)
                            : const Color(0xff63F67C),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 33,
                            color: Color(0xff080808),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Add Income',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SF-Pro',
                              color: Color(0xff080808),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
                const SizedBox(height: 20),
                const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro',
                    color: Color(0xff555555),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  cursorColor: const Color(0xffD2FA65),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro',
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF-Pro',
                      color: Color(0xff555555),
                    ),
                    filled: true,
                    fillColor: const Color(0xff131313),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0xff333333),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0xff333333),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0xff333333),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro',
                    color: Color(0xff555555),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: amountController,
                  onChanged: (value) {
                    setState(() {
                      amount = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: const Color(0xffD2FA65),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro',
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    prefix: const Text('\$ '),
                    prefixStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF-Pro',
                      color: amount.isEmpty
                          ? const Color(0xff555555)
                          : Colors.white,
                    ),
                    hintText: '0',
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF-Pro',
                      color: Color(0xff555555),
                    ),
                    filled: true,
                    fillColor: const Color(0xff131313),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0xff333333),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0xff333333),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0xff333333),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Auto payment every:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro',
                    color: Color(0xff555555),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    AutoPaymantWidgety(
                      onTap: () {
                        setState(() {
                          autoPaymant = 'Day';
                        });
                      },
                      type: 'Day',
                      isActive: autoPaymant == 'Day',
                    ),
                    AutoPaymantWidgety(
                      onTap: () {
                        setState(() {
                          autoPaymant = 'Week';
                        });
                      },
                      type: 'Week',
                      isActive: autoPaymant == 'Week',
                    ),
                    AutoPaymantWidgety(
                      onTap: () {
                        setState(() {
                          autoPaymant = 'Month';
                        });
                      },
                      type: 'Month',
                      isActive: autoPaymant == 'Month',
                    ),
                  ],
                ),
                if (isasdfasf) const SizedBox(height: 20),
                if (isasdfasf)
                  const Text(
                    'Category:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF-Pro',
                      color: Color(0xff555555),
                    ),
                  ),
                if (isasdfasf) const SizedBox(height: 10),
                if (isasdfasf)
                  transactionType == 'Income'
                      ? Row(
                          children: [
                            AutoPaymantWidgety(
                              vertical: 10,
                              onTap: () {
                                setState(() {
                                  category = 'Salary';
                                });
                              },
                              type: 'Salary',
                              isActive: category == 'Salary',
                            ),
                            AutoPaymantWidgety(
                              vertical: 10,
                              onTap: () {
                                setState(() {
                                  category = 'Dividents';
                                });
                              },
                              type: 'Dividents',
                              isActive: category == 'Dividents',
                            ),
                            AutoPaymantWidgety(
                              vertical: 10,
                              onTap: () {
                                setState(() {
                                  category = 'Freelance';
                                });
                              },
                              type: 'Freelance',
                              isActive: category == 'Freelance',
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            AutoPaymantWidgety(
                              vertical: 10,
                              onTap: () {
                                setState(() {
                                  category = 'Food';
                                });
                              },
                              type: 'Food',
                              isActive: category == 'Food',
                            ),
                            AutoPaymantWidgety(
                              vertical: 10,
                              onTap: () {
                                setState(() {
                                  category = 'Rent';
                                });
                              },
                              type: 'Rent',
                              isActive: category == 'Rent',
                            ),
                            AutoPaymantWidgety(
                              vertical: 10,
                              onTap: () {
                                setState(() {
                                  category = 'Education';
                                });
                              },
                              type: 'Education',
                              isActive: category == 'Education',
                            ),
                          ],
                        ),
                if (isasdfasf) const SizedBox(height: 10),
                if (isasdfasf)
                  Row(
                    children: [
                      AutoPaymantWidgety(
                        vertical: 10,
                        onTap: () {
                          setState(() {
                            category = 'Other';
                          });
                        },
                        type: 'Other',
                        isActive: category == 'Other',
                      ),
                      const Expanded(child: SizedBox()),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                const SizedBox(height: 22),
                if (!isasdfasf)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const UnlimPafe(sdasd: true),
                        ),
                      );
                    },
                    child: Image.asset(
                      transactionType == 'Income'
                          ? 'assets/images/IncomePremBud.png'
                          : 'assets/images/OutkPremBud.png',
                      width: double.infinity,
                    ),
                  ),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AutoPaymantWidgety extends StatelessWidget {
  const AutoPaymantWidgety({
    super.key,
    required this.onTap,
    required this.type,
    required this.isActive,
    this.vertical = 20,
    this.isExpanded = true,
  });
  final Function() onTap;
  final String type;
  final bool isActive;
  final double vertical;
  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? Expanded(
            child: InkWell(
              onTap: onTap,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: vertical),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color:
                      isActive ? const Color(0xffD0F864) : Colors.transparent,
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro',
                    color: isActive ? Colors.black : const Color(0xff555555),
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: vertical, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: isActive ? const Color(0xffD0F864) : Colors.transparent,
              ),
              child: Text(
                type,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF-Pro',
                  color: isActive ? Colors.black : const Color(0xff555555),
                ),
              ),
            ),
          );
  }
}
