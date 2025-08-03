// This class describes what type of data structure the Expense in app will have
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//get the dateformatter class with yMd() method and store it variable
final formatter = DateFormat.yMd();

//to generate unique id dynamically
//instantiate class from uuid.dart and store it in form of obj.
final uuid = const Uuid();

//Enum is used to create Custom type ; combination of predefined values
enum Category{
food, travel, leisure, work
}

//Icons for different category using enum values
const categoryIcons = {
Category.food: Icons.lunch_dining,
Category.travel: Icons.flight_takeoff,
Category.leisure: Icons.movie,
Category.work: Icons.work,

};
//to group data into single group or various groups 
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  
  final String id;
  final String title;
  final double amount;
  final DateTime date;    //to show expense date (built-in function)

  //category to categorize various expense (food,travel,entertainment)
  final Category category;

  //to format date using get method or using getter
  String get formattedDate      //using getter in dart 
  {
    return formatter.format(date);        //format date by manualling importing date module
  }

}

//to sumup data for the chart (real timeincrease decrease)

class ExpenseBucket
{
const ExpenseBucket ({required this.category, required this.expenses});

//adding additional constructor functions to class
//Get the list of all expense and its category
//this is use to set the value if that value belongs to only that particular category
// : is use for intializer 
//.where is use to filter items for particular list
ExpenseBucket.forCategory(
  List<Expense> allExpenses, 
  this.category
  )
  //if the particular expense is present in the list then only take it or use it 
  : expenses = allExpenses.where((expense)=> expense.category == category
  ).toList();

final Category category;
final List<Expense> expenses;

//add a getter to get the total utility expenses
double get totalExpenses 
{
  double sum= 0;

  //for in loop to go through each expense in expense list
  for(final expense in expenses)
  {
    sum += expense.amount;
  }
  return sum;
}
}