import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/main.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  
  @override
  Widget build(context) {
    return 
    //Card widget is like a rectangle butwith shadow and all makes it stand a bit more
    //takes a child parameter
    Card(
      // color: Color.fromARGB(255, 190, 253, 217), 
      child: Container(
        decoration: Theme.of(context).brightness == Brightness.dark 
            ? kDarkCardGradient 
            : kCardGradient,
        child: 
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 18,
            ),
      
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                children: [
                  Text(
                    expense.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox( height: 20),
              
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
                       Icon(categoryIcons[expense.category]),  //access from the list
                       const SizedBox(width: 8),
                       // we dont add () after formattedDate bcz it is getter not method
                       Text(expense.formattedDate),  // access from formatted date obj created in expense.dart
                      
                      
                    ],
                    ),
                ],
              )
            ],
            ), 
          ),
        ),
      );
  }
}