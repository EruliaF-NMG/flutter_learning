import 'package:flutter/material.dart';
import './widgets/NewTransactions.dart';
import './widgets/TransacrionList.dart';
import './models/Transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transactions> transactions = [
    Transactions('t6', "Test-1", 200, DateTime.now()),
    Transactions('t7', "Test-2", 300, DateTime.now()),
  ];

  void _onAddnew(String tital, double amount) {
    final tran =
        Transactions(DateTime.now().toString(), tital, amount, DateTime.now());
        setState(() {
          transactions.add(tran);
        });
  }

  void _showNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (modelContext) {
          return GestureDetector(
            onTap: (){},
            child: NewTransactions(_onAddnew),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: Colors.blue,
                child: Text('Chart'),
              ),
            ),
            TransacrionList(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showNewTransaction(context),
      ),
    );
  }
}
