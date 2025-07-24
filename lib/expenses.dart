import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

//take statefulWidget because we need to perform action in app here
//like add expenses etc
//stateful widget has two class one is that implement state and other that builds a state

class Expenses extends StatefulWidget {
const Expenses ({super.key});      //constructor

//we are overriding a createState () of Expense Widget and is returning the build state method

  @override
  State<Expenses> createState() {
   return _ExpensesState();
  }

}

class _ExpensesState extends State<Expenses>
{
  //Creating the dummy data in the app (data that already exist)
  final List<Expense> _registeredExpenses = 
  [
    Expense(
      title : 'App Development Course',
      amount : 200.00,
      date : DateTime.now(), 
      category : Category.work,
      ),

     Expense(
      title : 'Cinema',
      amount : 500.00,
      date : DateTime.now(), 
      category : Category.leisure,
      ),
  ];
  
  @override
  Widget build(context) {

    // Scaffold widget to set font and all
   return Scaffold(
    body: Column(
      children: [
        Text('The Chart'),
        Text('Expense List'),
      ],
    ),
   );
  }
}