import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatelessWidget
{
  //accepts list of expenses 
  const ExpensesList ({super.key, required this.expenses,});
  final List<Expense> expenses;

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
      ExpenseItem(expenses[index]),
    );
  }
}