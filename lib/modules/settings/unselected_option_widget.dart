import 'package:flutter/material.dart';

class UnSelectedOptionWidget extends StatelessWidget {
  final String unselectedTitle;

  const UnSelectedOptionWidget({super.key, required this.unselectedTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(unselectedTitle),
    );
  }
}
