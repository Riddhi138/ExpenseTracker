import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpenseItem extends StatelessWidget
{
  const ExpenseItem (this.expense, {super.key});
  final Expense expense;
  
  @override
  Widget build(context) {
    return 
    //Card widget is like a rectangle butwith shadow and all makes it stand a bit more
    //takes a child parameter
    Card(
      child: 
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 18,
          ),
          child:
          Column(
            children: [
            Text(expense.title),
            const SizedBox( height: 5),
            Row(
              children: [

                //.toStringAsFixed(2) sets the big value to value with 2 figit after decimal
                // esacpe means telling flutter which is value and which is lines to display
                //escaping is done using \ 
                Text('\₹${expense.amount.toStringAsFixed(2)}'),
                
                //Spacer widget gets the required space to display its items on screen
                const Spacer(),
                Row(
                  children: [
                     Icon(Icons.alarm),
                     const SizedBox(width: 8),
                     Text(expense.date.toString()),
                    
                    
                  ],
                  ),
              ],
            )
          ],
          ), 
        ),
    );

  }
}