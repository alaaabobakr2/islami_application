import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/modules/hadeth/hadeth_details.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<HadethContent> allHadethContent = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethContent.isEmpty) readFile();
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/images/hadeth.png"),
        const Divider(
          thickness: 1.5,
          indent: 15,
          endIndent: 15,
          height: 10,
        ),
        const Text(
          "الأحاديث",
          style: TextStyle(fontSize: 35),
        ),
        const Divider(
          thickness: 1.5,
          indent: 15,
          endIndent: 15,
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadethDetails.routeName,
                    arguments: HadethContent(
                        title: allHadethContent[index].title,
                        content: allHadethContent[index].content));
              },
              child: Text(
                allHadethContent[index].title,
                textAlign: TextAlign.center,
              ),
            ),
            separatorBuilder: (context, index) => const Divider(
              thickness: 1.5,
              indent: 60,
              endIndent: 60,
              height: 8,
            ),
            itemCount: allHadethContent.length,
          ),
        ),
      ],
    );
  }

  readFile() async {
    String text = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadeth = text.split("#");
    for (int i = 0; i < allHadeth.length; i++) {
      String singleHadeth = allHadeth[i].trim();
      int indexOfFirstLine = singleHadeth.indexOf("\n");
      String title = singleHadeth.substring(0, indexOfFirstLine);
      String content = singleHadeth.substring(indexOfFirstLine + 1);

      HadethContent hadethContent =
          HadethContent(title: title, content: content);

      setState(() {
        allHadethContent.add(hadethContent);
      });
    }
  }
}

class HadethContent {
  final String title;
  final String content;

  HadethContent({required this.title, required this.content});
}
