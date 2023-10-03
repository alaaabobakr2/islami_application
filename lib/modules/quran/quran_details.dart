import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/modules/quran/quran_view.dart';
import 'package:islami_app/application_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "Quran Details";

  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  String content = "";
  List<String> allVerses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetails;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);

    if (allVerses.isEmpty) readFiles(args.suraNumber);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(appProvider.backgroundImage()), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "إسلامي",
            style: TextStyle(
              color: appProvider.isDark() ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
          margin:
              const EdgeInsets.only(top: 30, bottom: 70, left: 30, right: 30),
          width: mediaQuery.width,
          height: mediaQuery.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:
                appProvider.isDark() ? const Color(0xFF0A0D17) : Colors.white70,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " سورة ${args.suraName}",
                    style: TextStyle(
                        color: appProvider.isDark()
                            ? const Color(0xFFFACC1D)
                            : Colors.black,
                        fontSize: 32),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Icon(
                    Icons.play_circle,
                    size: 32,
                    color: appProvider.isDark()
                        ? const Color(0xFFFACC1D)
                        : Colors.black,
                  )
                ],
              ),
              const Divider(
                endIndent: 40,
                indent: 40,
                thickness: 1.2,
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    "${allVerses[index]}(${index + 1})",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: appProvider.isDark()
                            ? const Color(0xFFFACC1D)
                            : Colors.black,
                        fontSize: 27),
                  ),
                  itemCount: allVerses.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  readFiles(String index) async {
    String text = await rootBundle.loadString("assets/files/$index.txt");
    content = text;
    setState(() {
      allVerses = content.split("\n");
    });
  }
}
