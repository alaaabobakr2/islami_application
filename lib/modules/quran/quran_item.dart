import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';

class QuranItem extends StatelessWidget {
  final String suraName;
  final String suraNumber;

  const QuranItem(
      {super.key, required this.suraName, required this.suraNumber});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Row(
      children: [
        Expanded(
            child: Text(suraNumber,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appProvider.isDark() ? Colors.white : Colors.black,
                ))),
        Container(
          width: 1.2,
          height: 45,
          color: appProvider.isDark()
              ? const Color(0xFFFACC1D)
              : theme.primaryColor,
        ),
        Expanded(
            child: Text(
          suraName,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        )),
      ],
    );
  }
}
