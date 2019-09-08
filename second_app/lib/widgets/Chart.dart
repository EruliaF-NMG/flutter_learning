import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Transactions.dart';
import './ChartBar.dart';

class Chart extends StatelessWidget {
  final List<Transactions> transactions;

  Chart(this.transactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double sum = 0.00;

      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekDay.day &&
            transactions[i].date.month == weekDay.month &&
            transactions[i].date.year == weekDay.year) {
          sum = sum + transactions[i].amount;
        }
      }

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": sum
      };
    }).reversed.toList();
  }

  double get sumAllValues{
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + item["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValues.map((data) {
            return Flexible(
                  fit:FlexFit.tight,
                  child: ChartBar(
                  data['day'],
                  data['amount'], 
                  sumAllValues==0.0?0.0:(data["amount"] as double) / sumAllValues
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
