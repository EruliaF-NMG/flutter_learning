import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/NewTransactions.dart';
import './widgets/TransacrionList.dart';
import './widgets/Chart.dart';
import './models/Transactions.dart';

void main() {
  //desable portait
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitUp
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: "Quicksand",
        //errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
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
    // Transactions('t6', "Test-1", 200, DateTime.now()),
    // Transactions('t7', "Test-2", 300, DateTime.now()),
  ];

  bool showChart = false;

  List<Transactions> get _resentDates {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(
        days: 7,
      )));
    }).toList();
  }

  void _onAddnew(String tital, double amount, DateTime selectedDay) {
    final tran =
        Transactions(DateTime.now().toString(), tital, amount, selectedDay);
    setState(() {
      transactions.add(tran);
    });
  }

  void _removeItem(String id) {
    setState(() {
      transactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _showNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (modelContext) {
          return GestureDetector(
            onTap: () {},
            child: NewTransactions(_onAddnew),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text('Personal Expenses'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _showNewTransaction(context),
        )
      ],
    );

    final trxList = Container(
      height: ((MediaQuery.of(context).size.height) -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransacrionList(transactions, _removeItem),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandScape)
              Row(
                children: <Widget>[
                  Text("Show Chart"),
                  Switch(
                    value: showChart,
                    onChanged: (value) {
                      setState(() {
                        showChart = value;
                      });
                    },
                  )
                ],
              ),
            if (!isLandScape)
              Container(
                height: ((MediaQuery.of(context).size.height) -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_resentDates),
              ),
            if (!isLandScape) trxList,
            if (isLandScape)
              (showChart)
                  ? Container(
                      height: ((MediaQuery.of(context).size.height) -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(_resentDates),
                    )
                  : trxList,
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
