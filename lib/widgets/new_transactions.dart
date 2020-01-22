import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final titleController=TextEditingController();
  final amountController=TextEditingController();
  final Function addTx;

  NewTransactions(this.addTx);
  void submitData(){
    final enteredData=titleController.text;
    final enteredAmount=double.parse( amountController.text );

    if(enteredData .isEmpty || enteredAmount <=0){
      return;
    }
    addTx(enteredData,enteredAmount);

    // addTx(titleController.text,double.parse( amountController.text));

  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_)=>submitData(),
              // onChanged: (val){
              //   titleInput=val;

              // },
              ),
              TextField(decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=>submitData(),
              // onChanged: (val)=> amountInput = val,
              ),
              FlatButton(child: Text("Add Transaction"),
              textColor: Colors.lightBlue,
              onPressed: submitData,
              ),
            ],
          ),
        )
      );
  }
}