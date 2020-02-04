import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addTx;

  NewTransactions(this.addTx);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final _titleController=TextEditingController();
  final _amountController=TextEditingController();
  DateTime _selectedDate;

  void _submitData(){
    if(_amountController.text.isEmpty){
      return;
    }
    final enteredData=_titleController.text;
    final enteredAmount=double.parse( _amountController.text );

    if(enteredData .isEmpty || enteredAmount <=0 || _selectedDate==null){
      return;
    }
    widget.addTx(enteredData,enteredAmount,_selectedDate);
    Navigator.of(context).pop();

    // addTx(titleController.text,double.parse( amountController.text));

  }
  void _presentDatePicker(){
    showDatePicker(context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime.now(),
    ).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      setState(() {
        _selectedDate=pickedDate;
      });
      
    });

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
              controller: _titleController,
              onSubmitted: (_)=>_submitData(),
              // onChanged: (val){
              //   titleInput=val;

              // },
              ),
              TextField(decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=>_submitData(),
              // onChanged: (val)=> amountInput = val,
              ),
              Container(
                height: 70.0,
                child: Row(children: <Widget>[
                  Expanded(
                     child: Text(_selectedDate == null?"No date Choosen !" : 
                    'Picked Date:${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text('Choose Date',style: TextStyle(fontWeight: FontWeight.bold),),
                  onPressed: _presentDatePicker
                  ,)
                ],),
              ),
              RaisedButton(child: Text("Add Transaction",style: TextStyle(fontWeight: FontWeight.bold),),
              color: Colors.lightBlue,
              onPressed: _submitData,
              ),
            ],
          ),
        )
      );
  }
}