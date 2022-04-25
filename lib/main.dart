import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'view/expense_checker_app.dart';

/// adding first branch
/// ignoring the pull request
///
//void main() => runApp(const ExpenseCheckerApp());

abstract class ListItems {
  Widget getTitle(BuildContext context);
  Widget getSubTitle(BuildContext context);
}

void main() {
  runApp(
    MyApp(
      items: List<ListItems>.generate(
        11,
        (i) => i % 2 == 0
            ? TitleWidget('Even Number: $i')
            : SubTitleWidget('Odd Number: $i'),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<ListItems> items;

  const MyApp({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'A List Generated Example';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: index == 0 ? null : item.getTitle(context),
              subtitle: item.getSubTitle(context),
            );
          },
        ),
      ),
    );
  }
}

class SubTitleWidget extends ListItems {
  final String subTitle;
  SubTitleWidget(this.subTitle);

  @override
  Widget getSubTitle(BuildContext context) {
    return Text(
      subTitle,
      style: GoogleFonts.laila(
        fontSize: 20.0,
      ),
    );
  }

  @override
  Widget getTitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class TitleWidget extends ListItems {
  final String title;
  TitleWidget(this.title);

  @override
  Widget getTitle(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.laila(
        fontSize: 40.0,
      ),
    );
  }

  @override
  Widget getSubTitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}
