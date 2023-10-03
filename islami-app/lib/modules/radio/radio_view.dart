import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Image.asset("assets/images/radio.png"),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "إذاعة القرآن الكريم",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous_rounded,
              size: 60,
              color: appProvider.isDark()
                  ? const Color(0xFFFACC1D)
                  : theme.primaryColor,
            ),
            Icon(
              Icons.play_arrow,
              size: 80,
              color: appProvider.isDark()
                  ? const Color(0xFFFACC1D)
                  : theme.primaryColor,
            ),
            Icon(
              Icons.skip_next_rounded,
              size: 60,
              color: appProvider.isDark()
                  ? const Color(0xFFFACC1D)
                  : theme.primaryColor,
            )
          ],
        )
      ],
    );
  }
}
