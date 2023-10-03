import 'package:flutter/material.dart';
import 'package:islami_app/modules/provider/app_provider.dart';
import 'package:islami_app/modules/quran/quran_details.dart';
import 'package:islami_app/splash_screen.dart';
import 'package:provider/provider.dart';
import 'application_theme.dart';
import 'home_layout.dart';
import 'modules/hadeth/hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        theme: ApplicationTheme.lightTheme,
        darkTheme: ApplicationTheme.darkTheme,
        themeMode: appProvider.currentTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(appProvider.currentLocal),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeLayout.routeName: (context) => const HomeLayout(),
          QuranDetails.routeName: (context) => const QuranDetails(),
          HadethDetails.routeName: (context) => const HadethDetails(),
        });
  }
}
