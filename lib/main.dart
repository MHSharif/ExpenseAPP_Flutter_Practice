import 'package:expense_app/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


//  String titleInput;
//  String amountInput;
  final titleController = TextEditingController();
  final amountController =TextEditingController();



  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      tittle: 'Keyboard',
      amount: 1500,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      tittle: 'Monitor',
      amount: 15000,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Expense'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,



                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Tittle'),
                    controller: titleController,
//                    onChanged: (val){
//                      titleInput=val;
//                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,

//                    onChanged: (val){
//                      amountInput=val;
//                    },
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    onPressed: (){
//                      print(titleInput);
//                      print(amountInput);
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transaction.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$: ${tx.amount}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.tittle,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(tx.date),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
