import 'package:flutter/material.dart';
import 'package:islami_app/modules/settings/language_bottom_sheet_widget.dart';
import 'package:islami_app/modules/settings/settings_item.dart';
import 'package:islami_app/modules/settings/theme_bottom_sheet_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../provider/app_provider.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    var locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
      child: Column(
        children: [
          SettingItems(
            settingOptionTitle: locale.language,
            onOptionTaped: () {
              showLanguageBottomSheet(context);
            },
            selectedOption:
                appProvider.currentLocal == "en" ? "English" : "عربي",
          ),
          const SizedBox(
            height: 30,
          ),
          SettingItems(
            settingOptionTitle: locale.theme,
            onOptionTaped: () {
              showThemeBottomSheet(context);
            },
            selectedOption: appProvider.isDark() ? locale.dark : locale.light,
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const LanguageBottomSheetWidget());
  }

  void showThemeBottomSheet(context) {
    showModalBottomSheet(
        context: context, builder: (context) => const ThemeBottomSheetWidget());
  }
}
