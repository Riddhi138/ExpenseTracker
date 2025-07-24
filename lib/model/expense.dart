// This class describes what type of data structure the Expense in app will have
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

//to generate unique id dynamically
//instantiate class from uuid.dart and store it in form of obj.
final uuid = const Uuid();

//Enum is used to create Custom type ; combination of predefined values
enum Category{
food, travel, leisure, work
}

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

}