import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
     MaterialApp(
      //TO ADD MAIN WIDGET HERE
      theme: ThemeData(useMaterial3: true),
      home: Expenses(),       //set home page as expenses widget

    ),
  );
}
