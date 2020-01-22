
import 'package:flutter/material.dart';
import './new_transactions.dart';
import './translist.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transactions>_userTransactions = [
    Transactions(id : "t1",title: "Shoes",amount: 500,date: DateTime.now(),),
    Transactions(id : "t2",title: "Shirt",amount: 1000,date: DateTime.now(),),
  ];
  void _addNewTransactions(String txtitle,double txAmount){
    final newtx= Transactions(title: txtitle, amount: txAmount,date: DateTime.now(),
    id: DateTime.now().toString(),);
    setState(() {
      _userTransactions.add(newtx);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransactions(_addNewTransactions),
      TransactionList(_userTransactions),

    ],);
  }
}