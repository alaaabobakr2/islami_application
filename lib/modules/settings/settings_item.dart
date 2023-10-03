import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';

typedef SettingOptionClicked = void Function();

class SettingItems extends StatelessWidget {
  final String settingOptionTitle, selectedOption;
  final SettingOptionClicked onOptionTaped;

  const SettingItems(
      {super.key,
      required this.settingOptionTitle,
      required this.onOptionTaped,
      required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(settingOptionTitle,
            textAlign: TextAlign.end, style: theme.textTheme.bodyLarge),
        GestureDetector(
          onTap: onOptionTaped,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            width: mediaQuery.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: appProvider.isDark()
                      ? const Color(0xFFFACC1D)
                      : theme.primaryColor,
                  width: 1.6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedOption),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  color: appProvider.isDark()
                      ? const Color(0xFFFACC1D)
                      : theme.primaryColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
