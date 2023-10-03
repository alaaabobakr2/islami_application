import 'package:flutter/material.dart';
import 'package:islami_app/modules/hadeth/hadeth_view.dart';
import 'package:provider/provider.dart';
import '../../application_theme.dart';
import '../provider/app_provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "Hadeth Details";

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  String content = "";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethContent;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(appProvider.isDark()
                ? "assets/images/bg_dark.png"
                : "assets/images/img_9.png"),
            fit: BoxFit.fill),
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
              Text(
                args.title,
                style: TextStyle(
                  color: appProvider.isDark()
                      ? const Color(0xFFFACC1D)
                      : Colors.black,
                ),
              ),
              const Divider(
                endIndent: 40,
                indent: 40,
                thickness: 1.2,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                      textAlign: TextAlign.center,
                      args.content,
                      style: TextStyle(
                        color: appProvider.isDark()
                            ? const Color(0xFFFACC1D)
                            : Colors.black,
                      )),
                  itemCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
