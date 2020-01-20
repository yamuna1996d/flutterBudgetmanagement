import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transactions>transaction =[
    Transactions(id : "t1",title: "Shoes",amount: 500,date: DateTime.now(),),
    Transactions(id : "t2",title: "Shirt",amount: 1000,date: DateTime.now(),),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Flutter App"),),
    body: Column(children: <Widget>[
      Container(width: 300,child: Card(
        color: Colors.lightBlue,
        child: Text("Hello"),
        elevation: 10,
      ),),
      Card(
        elevation: 10,
        
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(decoration: InputDecoration(labelText: "Title"),),
              TextField(decoration: InputDecoration(labelText: "Amount"),),
              FlatButton(child: Text("Add Transaction"),
              textColor: Colors.lightBlue,
              onPressed: (){},),
            ],
          ),
        )
      ),
      Column(children: transaction.map((t) {
        return Card(child:Row(children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue,width: 3,),
            ),
            padding: EdgeInsets.all(10),
            child: Text('₹'+ t.amount.toString(),
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
    ],),);
  }
}
