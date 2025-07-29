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