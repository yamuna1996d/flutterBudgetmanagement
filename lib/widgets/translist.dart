import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions>transactions;
  final Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);



  @override
  Widget build(BuildContext context) {
    return     
    Container(
      height: 450,
      child:transactions.isEmpty? Column(children: <Widget>[
        Text('No Transactions yet !', style:Theme.of(context).textTheme.title,
        ),
        Container(
          height: 200,
          child: Image.asset('assets/images/poket.png',fit: BoxFit.cover,)),

      ],):
       ListView.builder(
        itemBuilder: (ctx,index){
           return Card(
             elevation: 5,
             margin: EdgeInsets.symmetric(vertical: 8,horizontal: 6),
                        child: ListTile(
               leading: CircleAvatar(radius: 28,
               child:Padding(
                 padding: EdgeInsets.all(7),
                 child: FittedBox(child: Text('₹'+transactions[index].amount.toStringAsFixed(2),)),
               ),
             ),
             title: Text(transactions[index].title,style:Theme.of(context).textTheme.title,),
             subtitle: Text(DateFormat.yMMMd().format(transactions[index].date),
              ),
              trailing: IconButton(icon: Icon(Icons.delete),color: Theme.of(context).errorColor,
              onPressed:()=> deleteTx(transactions[index].id),),
             ),
           );
        },
        itemCount: transactions.length,
        
         
       ),
    );
      
  }
}




