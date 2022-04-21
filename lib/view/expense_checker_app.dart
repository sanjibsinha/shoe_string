import 'package:flutter/material.dart';

import 'expense_checker_home_page.dart';

class ExpenseCheckerApp extends StatelessWidget {
  const ExpenseCheckerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Check Your Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const ExpenseCheckerHomePage(),
    );
  }
}
