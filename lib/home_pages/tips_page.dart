import 'package:all_fam_141/content/tips_content.dart';
import 'package:flutter/material.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tips',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            fontFamily: 'SF-Pro',
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView.separated(
        padding:
            const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 50),
        itemCount: tipsList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) => TipsWidget(model: tipsList[index]),
      ),
    );
  }
}

class TipsWidget extends StatelessWidget {
  const TipsWidget({
    super.key,
    required this.model,
  });

  final TipsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff131313),
        border: Border.all(
          color: const Color(0xff333333),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'SF-Pro',
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            model.desk,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF-Pro',
              color: Color(0xff555555),
            ),
          ),
        ],
      ),
    );
  }
}
