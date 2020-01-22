import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions>transactions;
  TransactionList(this.transactions);



  @override
  Widget build(BuildContext context) {
    return     
    Container(
      child: Column(children: transactions.map((t) {
          return Card(child:Row(children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue,width: 3,),
              ),
              padding: EdgeInsets.all(10),
              child: Text('₹'+ t.amount.toStringAsFixed(2),
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),

              ),),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start, (for make the alignment to the left)
              children: <Widget>[
              Text(t.title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              Text(DateFormat().format(t.date),
              )
              // Text(t.date.toString())

            ],)
          ],),);
        }).toList(),),
    );
      
  }
}