import 'package:flutter/material.dart';
import 'package:islami_app/modules/provider/app_provider.dart';
import 'package:islami_app/modules/settings/selected_option_widget.dart';
import 'package:islami_app/modules/settings/unselected_option_widget.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheetWidget extends StatelessWidget {
  const LanguageBottomSheetWidget({super.key});

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
              appProvider.changeLanguage("en");
              Navigator.pop(context);
            },
            child: appProvider.currentLocal == "en"
                ? const SelectedOptionWidget(selectedTitle: "English")
                : const UnSelectedOptionWidget(
                    unselectedTitle: "English",
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                appProvider.changeLanguage("ar");
                Navigator.pop(context);
              },
              child: appProvider.currentLocal == "ar"
                  ? const SelectedOptionWidget(selectedTitle: "عربي")
                  : const UnSelectedOptionWidget(unselectedTitle: "عربي")),
        ],
      ),
    );
  }
}
