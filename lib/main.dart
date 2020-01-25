
import './widgets/translist.dart';

import './widgets/new_transactions.dart';
import './models/transaction.dart';
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

class MyHomePage extends StatefulWidget {
  
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final List<Transactions>_userTransactions = [
    // Transactions(id : "t1",title: "Shoes",amount: 500,date: DateTime.now(),),
    // Transactions(id : "t2",title: "Shirt",amount: 1000,date: DateTime.now(),),
  ];
  void _addNewTransactions(String txtitle,double txAmount){
    final newtx= Transactions(title: txtitle, amount: txAmount,date: DateTime.now(),
    id: DateTime.now().toString(),);
    setState(() {
      _userTransactions.add(newtx);
    });

  }

  void _startAddNewTransactions(BuildContext ctx){
    showModalBottomSheet(context:ctx,builder: (_){
      return GestureDetector(
        onTap: (){},
        
        child: NewTransactions(_addNewTransactions),
        behavior: HitTestBehavior.opaque,);

    } ,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Flutter App"),
    actions: <Widget>[
      IconButton(icon:Icon(Icons.add),
      onPressed:()=> _startAddNewTransactions(context),
      ),],
    ),

    body:SingleChildScrollView(child:
     Column(children: <Widget>[
      Container(width: 300,child: Card(
        color: Colors.lightBlue,
        child: Text("Hello"),
        elevation: 10,
      ),),
      TransactionList( _userTransactions),
    ],
    ),),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
    onPressed: ()=> _startAddNewTransactions(context),),
    );
  }
}
