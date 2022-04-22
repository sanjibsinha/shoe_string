import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/new_transaction.dart';
import '../model/transaction.dart';

class ExpenseCheckerHomePage extends StatefulWidget {
  const ExpenseCheckerHomePage({Key? key}) : super(key: key);
  @override
  _ExpenseCheckerHomePageState createState() => _ExpenseCheckerHomePageState();
}

class _ExpenseCheckerHomePageState extends State<ExpenseCheckerHomePage> {
  final List<Transaction> _transactionList = [];

  List<Transaction> get _latestTransactions {
    return _transactionList.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction(
      String transactionTitle, double transactionAmount, DateTime chosenDate) {
    final newtransaction = Transaction(
      title: transactionTitle,
      amount: transactionAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactionList.add(newtransaction);
    });
  }

  void _startAddingTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Check Your Expenses',
          style: GoogleFonts.oswald(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddingTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Chart(_latestTransactions),
            //TransactionList(_transactionList),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddingTransaction(context),
      ),
    );
  }
}
