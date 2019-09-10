import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function onAdd;

  NewTransactions(this.onAdd);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titalController = TextEditingController();

  final amountController = TextEditingController();

  DateTime selectedDay;

  void submitForm() {
    final enterdTital = titalController.text;
    final enterdAmount = double.parse(amountController.text);
    if (enterdTital.isEmpty || enterdAmount <= 0 || selectedDay == null) {
      return;
    }
    widget.onAdd(enterdTital, enterdAmount, selectedDay);
    Navigator.of(context).pop();
  }

  void showDateBox(context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }

      this.setState(() {
        selectedDay = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Tital"),
                //onChanged:(value)=>titalInput=value ,
                controller: titalController,
                onSubmitted: (_) => submitForm(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                //onChanged:(value)=>amountInput=value ,
                keyboardType: TextInputType.number,
                controller: amountController,
                onSubmitted: (_) => submitForm(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(selectedDay == null
                          ? "No Selected Date"
                          : DateFormat.yMMMd().format(selectedDay)),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        "Select a Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => showDateBox(context),
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Set Trancations'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () => submitForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
