
import './widgets/user_transaction.dart';
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
  
  // String titleInput;
  // String amountInput;
  final titleControler= TextEditingController();
  final amountController= TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Flutter App"),),

    body:SingleChildScrollView(child:
     Column(children: <Widget>[
      Container(width: 300,child: Card(
        color: Colors.lightBlue,
        child: Text("Hello"),
        elevation: 10,
      ),),
      UserTransaction(),
    ],
    ),),
    );
  }
}
