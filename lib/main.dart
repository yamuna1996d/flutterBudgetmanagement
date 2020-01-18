import './transaction.dart';
import 'package:flutter/material.dart';

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
      Column(children: transaction.map((t) {
        return Card(child:Row(children: <Widget>[
          Container(child: Text(t.amount.toString(),),),
          Column(children: <Widget>[
            Text(t.title),
            Text(t.date.toString())

          ],)
        ],),);
      }).toList(),),
    ],),);
  }
}
