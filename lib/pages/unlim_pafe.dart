import 'package:all_fam_141/main.dart';
import 'package:all_fam_141/pages/bot_change_screen.dart';
import 'package:all_fam_141/pages/jftdhh.dart';
import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnlimPafe extends StatefulWidget {
  const UnlimPafe({super.key, this.sdasd = false});
  final bool sdasd;

  @override
  State<UnlimPafe> createState() => _UnlimPafeState();
}

class _UnlimPafeState extends State<UnlimPafe> {
  bool asdfasfasf = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: InkWell(
            onTap: () {
              if (widget.sdasd) {
                Navigator.pop(context);
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const BotChangeScreen(),
                  ),
                  (pred) => false,
                );
              }
            },
            child: Icon(
              Icons.close,
              size: 35,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              final hasPremiumAccess = await Apphud.hasPremiumAccess();
              final hasActiveSubscription =
                  await Apphud.hasActiveSubscription();
              if (hasPremiumAccess || hasActiveSubscription) {
                await affaafaf.setBool('sdfdsfsdf', true);
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: const Text('Success!'),
                    content: const Text('Your purchase has been restored!'),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const BotChangeScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: const Text('Restore purchase'),
                    content: const Text(
                        'Your purchase is not found. Write to support: https://forms.gle/mdmW3VDo1Mx4HF369'),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () => {Navigator.of(context).pop()},
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Image.asset(
              'assets/images/restIMage.png',
              height: 36.h,
            ),
          ),
          SizedBox(width: 26.w),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/premIMage.png',
                ),
              ),
              SizedBox(height: 24.h),
              const Text(
                'Get Premium',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SF-Pro',
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.h),
              const PremCont(title: 'Categorising your income / expense'),
              SizedBox(height: 10.h),
              const PremCont(title: 'Statistics for 6 months or more'),
              SizedBox(height: 10.h),
              const PremCont(title: 'No ADs'),
              SizedBox(height: 30.h),
              InkWell(
                onTap: () async {
                  setState(() {
                    asdfasfasf = true;
                  });

                  final apphudPaywalls = await Apphud.paywalls();
                  print(apphudPaywalls);
                  await Apphud.purchase(
                    product: apphudPaywalls?.paywalls.first.products?.first,
                  ).whenComplete(
                    () async {
                      if (await Apphud.hasPremiumAccess() ||
                          await Apphud.hasActiveSubscription()) {
                        final hasPremiumAccess =
                            await Apphud.hasPremiumAccess();
                        final hasActiveSubscription =
                            await Apphud.hasActiveSubscription();
                        if (hasPremiumAccess || hasActiveSubscription) {
                          await affaafaf.setBool('sdfdsfsdf', true);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text('Success!'),
                              content: const Text(
                                  'Your purchase has been restored!'),
                              actions: [
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const BotChangeScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text('Restore purchase'),
                              content: const Text(
                                  'Your purchase is not found. Write to support: https://forms.gle/46cVxFRVPTQcKQvy9'),
                              actions: [
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  onPressed: () =>
                                      {Navigator.of(context).pop()},
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        }
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BotChangeScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                  );
                  setState(() {
                    asdfasfasf = false;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  decoration: BoxDecoration(
                    color: const Color(0xffD2FA65),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: asdfasfasf
                      ? const CircularProgressIndicator.adaptive()
                      : const Text(
                          'Buy Premium \$0.99',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SF-Pro',
                            color: Colors.black,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Ofksdfsdf(
                            title: 'Privacy Policy',
                            url:
                                'https://docs.google.com/document/d/1B7Mu9eKjEwFf3cCTxHAl-BYlAohFOwVuGP4zgaKN23M/edit?usp=sharing',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/pr_image.png',
                      height: 36.h,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Ofksdfsdf(
                            title: 'Terms of Use',
                            url:
                                'https://docs.google.com/document/d/1UcsYo7uJbP8dWCv7UwEi0pkQMgQ3r1oJ4r5AbQMgnpQ/edit?usp=sharing',
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/trImage.png',
                      height: 36.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

class PremCont extends StatelessWidget {
  const PremCont({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xff131313),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color(0xff333333),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'SF-Pro',
          color: Colors.white.withOpacity(0.55),
        ),
      ),
    );
  }
}
