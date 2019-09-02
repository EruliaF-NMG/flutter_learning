import 'package:flutter/material.dart';

import '../models/Transactions.dart';
import './NewTransactions.dart';
import './TransacrionList.dart';


class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  List<Transactions> transactions = [
    Transactions('t6', "Test-1", 200, DateTime.now()),
    Transactions('t7', "Test-2", 300, DateTime.now()),
  ];

  void _onAddnew(String tital,double amount){
    final tran=Transactions(DateTime.now().toString(),tital,amount,DateTime.now());
    setState(() {
      transactions.add(tran);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransactions(_onAddnew),
        TransacrionList(transactions),
      ],
    );
  }
}
