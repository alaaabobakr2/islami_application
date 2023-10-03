import 'package:flutter/material.dart';
import 'package:islami_app/modules/provider/app_provider.dart';
import 'package:islami_app/modules/quran/quran_details.dart';
import 'package:islami_app/modules/quran/quran_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../application_theme.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  final List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Image.asset("assets/images/quran.png"),
        const Divider(
          thickness: 1.5,
          indent: 15,
          endIndent: 15,
          height: 5,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              "رقم السورة",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            )),
            Container(
              width: 1.2,
              height: 45,
              color: appProvider.isDark()
                  ? const Color(0xFFFACC1D)
                  : theme.primaryColor,
            ),
            Expanded(
                child: Text(
              "اسم السورة",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            )),
          ],
        ),
        const Divider(
          thickness: 1.5,
          indent: 15,
          endIndent: 15,
          height: 5,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, QuranDetails.routeName,
                    arguments: SuraDetails(
                        suraName: suraNames[index],
                        suraNumber: "${index + 1}"));
              },
              child: QuranItem(
                suraName: suraNames[index],
                suraNumber: "${index + 1}",
              ),
            ),
            itemCount: 114,
          ),
        ),
      ],
    );
  }
}

class SuraDetails {
  String suraName;
  String suraNumber;

  SuraDetails({required this.suraName, required this.suraNumber});
}
