import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {

  final Function onAdd;

  NewTransactions(this.onAdd);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titalController=TextEditingController();

  final amountController=TextEditingController();

  void submitForm(){
    final enterdTital=titalController.text;
    final enterdAmount=double.parse(amountController.text);
    if(enterdTital.isEmpty || enterdAmount <=0){
      return;
    }  
    widget.onAdd(enterdTital,enterdAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Tital"),
              //onChanged:(value)=>titalInput=value ,
              controller: titalController,
              onSubmitted: (_)=>submitForm(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              //onChanged:(value)=>amountInput=value ,
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_)=>submitForm(),
            ),
            FlatButton(
              child: Text('Set Trancations'),
              textColor: Colors.purple,
              onPressed: ()=>submitForm(),
            )
          ],
        ),
      ),
    );
  }
}
