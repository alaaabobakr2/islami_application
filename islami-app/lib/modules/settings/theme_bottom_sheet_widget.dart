import 'package:flutter/material.dart';
import 'package:islami_app/modules/provider/app_provider.dart';
import 'package:islami_app/modules/settings/selected_option_widget.dart';
import 'package:islami_app/modules/settings/unselected_option_widget.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheetWidget extends StatelessWidget {
  const ThemeBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              appProvider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: appProvider.isDark()
                ? const SelectedOptionWidget(selectedTitle: "Dark")
                : const UnSelectedOptionWidget(unselectedTitle: "Dark"),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              appProvider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: appProvider.isDark()
                ? const UnSelectedOptionWidget(unselectedTitle: "Light")
                : const SelectedOptionWidget(
                    selectedTitle: "Light",
                  ),
          ),
        ],
      ),
    );
  }
}
