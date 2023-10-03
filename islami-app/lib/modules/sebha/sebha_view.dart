import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application_theme.dart';
import '../provider/app_provider.dart';

class SebhaView extends StatefulWidget {
  static const String routeName = "Sebha Details";

  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  double angle = 0;
  List<String> text = ["سبحان الله", "الحمد لله", "الله أكبر"];
  int currentIndex = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appProvider = Provider.of<AppProvider>(context);
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.09),
                child: Transform.rotate(
                  angle: angle,
                  child: GestureDetector(
                    onTap: () {
                      clickOnImage();
                      setState(() {});
                    },
                    child: Image.asset(
                      appProvider.isDark()
                          ? "assets/images/body_sebha_dark.png"
                          : "assets/images/body_sebha_logo.png",
                      height: size.height * 0.20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.10),
                child: Image.asset(
                  appProvider.isDark()
                      ? "assets/images/head_sebha_dark.png"
                      : "assets/images/head_sebha_logo.png",
                  height: size.height * 0.12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "عدد التسبيحات",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: appProvider.isDark()
                    ? const Color(0xFF0A0D17)
                    : const Color(0xFFB6925F),
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              "$counter",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 140,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: appProvider.isDark()
                    ? const Color(0xFFFACC1D)
                    : const Color(0xFFB6925F),
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              text[currentIndex],
              style: TextStyle(
                color: appProvider.isDark() ? Colors.black : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void clickOnImage() {
    angle += 3;
    if (counter == 33) {
      counter = 0;
      currentIndex++;
      currentIndex = currentIndex % 3;
    }
    counter++;
    setState(() {});
  }
}
