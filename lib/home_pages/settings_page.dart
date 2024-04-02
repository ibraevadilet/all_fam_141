import 'package:all_fam_141/main.dart';
import 'package:all_fam_141/pages/jftdhh.dart';
import 'package:all_fam_141/pages/unlim_pafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isasdfasf = false;

  @override
  void initState() {
    isasdfasf = affaafaf.getBool('sdfdsfsdf') ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            fontFamily: 'SF-Pro',
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            if (!isasdfasf)
              InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const UnlimPafe(sdasd: true),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xffD2FA65),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Get Premium',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SF-Pro',
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),
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
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xff131313),
                  border: Border.all(
                    color: const Color(0xff333333),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF-Pro',
                        color: Color(0xffD2FA65),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
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
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xff131313),
                  border: Border.all(
                    color: const Color(0xff333333),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Terms of Use',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF-Pro',
                        color: Color(0xffD2FA65),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Ofksdfsdf(
                      title: 'Support',
                      url: 'https://forms.gle/46cVxFRVPTQcKQvy9',
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xff131313),
                  border: Border.all(
                    color: const Color(0xff333333),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF-Pro',
                        color: Color(0xffD2FA65),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
