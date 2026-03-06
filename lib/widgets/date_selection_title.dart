import 'package:flutter/material.dart';

import '../configs/size_config.dart';

class DateSectionTitle extends StatelessWidget {

  final String title;

  const DateSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: SizeConfig.blockHeight * 2.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}