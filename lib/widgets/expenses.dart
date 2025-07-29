import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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

  //to be able to add the expense when click on + icon in appbar
  void _openAddExpenseOverlay ()
  {
    //showModalBottomSheet used to show panel : slides up from the bottom of the screen.
    // used to display extra options, forms, or menus without leaving the current page
    showModalBottomSheet(
     context: context, 
     builder : (ctx) => const NewExpense(),
     );
    
  }

  @override
  Widget build(context) {

    // Scaffold widget to set font and all
   return Scaffold(
    //use appbar to add the bar at the top of the screen 
    appBar: AppBar(
      title: Text('Expense Tracker'),
      actions: [
        IconButton(
         onPressed: _openAddExpenseOverlay,    //action to be done on pressed
         icon: const Icon(Icons.add),          //function to add appbar
         ),
      ],  //mostly used to add button
    ),
    body: Column(
      children: [
        const Text('The Chart'),
        Expanded(
          child: 
             ExpensesList(expenses: _registeredExpenses)   //to show dummy data stored in _registeredExpenses
          ),
     
      ],
    ),
   );
  }
}