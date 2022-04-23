import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> yourTransactions;

  TransactionList(
    this.yourTransactions,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 300,
      child: yourTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'You\'ve not added any transaction.',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.purple,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 200,
                  child: Image.network(
                      'https://cdn.pixabay.com/photo/2019/10/18/19/51/financial-4560047_960_720.jpg'),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '\$${yourTransactions[index].amount}',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      yourTransactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(yourTransactions[index].date),
                    ),
                  ),
                );
              },
              itemCount: yourTransactions.length,
            ),
    );
  }
}
