import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget
{
  //accepts list of expenses 
  const ExpensesList ({super.key, required this.expenses,required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
@override
  Widget build( context) {
   
   //ListView() is used when the list length is not defined 
   //.builder shows the item on screen when it is about to visible during scrolling
   // .builder takes a unnamed function with context obj and index value provided by flutter
   // return a widget for what the function is written for 

   return ListView.builder(
    //when the itemCount increases the builder function will be called that many times
    itemCount: expenses.length,
    itemBuilder: (context, index) =>     
      //accessing expense title using index of list 
      //to delete we use dismissible
      Dismissible(
        onDismissed: (direction)
        {
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]), 
        direction: DismissDirection.endToStart,

        // more animation like delete text at bg
        background: Container(
    decoration: BoxDecoration(
      
      color: Color.fromARGB(166, 11, 145, 145),
      borderRadius: BorderRadius.circular(12),
    ),
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: 25),
    margin: EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.delete,
          color: Color.fromARGB(184, 0, 0, 0),
          size: 24,
        ),
      ],
        ),
        ),
        
        dismissThresholds: {
        DismissDirection.endToStart: 0.7,  // Need to swipe 70% to dismiss
        },
        child: ExpenseItem(expenses[index]),
        ),  
    );
  }
}