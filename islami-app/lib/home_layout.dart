import 'package:flutter/material.dart';
import 'package:islami_app/modules/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'modules/hadeth/hadeth_view.dart';
import 'modules/quran/quran_view.dart';
import 'modules/radio/radio_view.dart';
import 'modules/sebha/sebha_view.dart';
import 'modules/settings/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home Layout";

  const HomeLayout({super.key});

  @override
  HomeLayoutState createState() => HomeLayoutState();
}

class HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  static const List<Widget> screens = [
    QuranView(),
    HadethView(),
    SebhaView(),
    RadioView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(appProvider.backgroundImage()), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            local.islami,
            style: TextStyle(
              color: appProvider.isDark() ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/img_5.png")),
                label: local.quraan),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/img_6.png")),
                label: local.hadeth),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/img_7.png")),
                label: local.sebha),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/img_8.png")),
                label: local.radio),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: local.settings),
          ],
        ),
      ),
    );
  }
}
