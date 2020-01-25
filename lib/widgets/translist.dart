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
      height: 300,
      child:transactions.isEmpty? Column(children: <Widget>[
        Text('No Transactions yet !', style:Theme.of(context).textTheme.title,
        ),
        Container(
          height: 200,
          child: Image.asset('assets/images/poket.png',fit: BoxFit.cover,)),

      ],):
       ListView.builder(
        itemBuilder: (ctx,index){
           return Card(child:Row(children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue,width: 3,),
              ),
              padding: EdgeInsets.all(10),
              child: Text('₹'+ transactions[index].amount.toStringAsFixed(2),
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),

              ),),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start, (for make the alignment to the left)
              children: <Widget>[
              Text(transactions[index].title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              Text(DateFormat().format(transactions[index].date),
              )
              // Text(t.date.toString())

            ],)
          ],),);
        },
        itemCount: transactions.length,
        
         
       ),
    );
      
  }
}