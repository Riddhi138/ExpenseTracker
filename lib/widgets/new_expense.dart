import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/model/expense.dart';

//get the dateformatter class with yMd() method and store it variable
final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget
{
  const NewExpense({super.key, required this.onAddExpense});
//Function as an object to get the expense saved

final void Function (Expense expense) onAddExpense;
@override
  State<NewExpense> createState() {
   return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>
{
  //TextEditingController helps to do the heavy lifting of controlling the user input 
  final _titleController = TextEditingController();
  final _amtController = TextEditingController();
  DateTime ? _selectedDate;     //? after DateTime tells flutter either pick the date selected or pick nothing
  Category _selectedCategory = Category.leisure;
  //to pick a current date

  //async and await is used here to tell dart that the task will take time to complete
  //Hence here the date isn't already picked but will be picked in coming future

void _currentDatePicker() async
{
  //set current date or the date while u are creating/ adding expense
 final now = DateTime.now(); // add parentheses
 final firstDate = DateTime(now.year - 1, now.month, now.day);
 final lastdate = DateTime(now.year, now.month, now.day);

 // showDatePicker is the builtin function to set date
 final pickedDate = await showDatePicker(
   context: context,
   initialDate: now,
   firstDate: firstDate,
   lastDate: lastdate,
 );
 setState(() {
   _selectedDate = pickedDate;
 });
 
}


//vlidate the data 
void _submitExpenseData ()
{
  //parse amount that is in string to double
  final enteredAmt = double.tryParse(_amtController.text);
  //check dynamically is amt entered is null or not and smaller than zero
  final amtInvalid = enteredAmt == null || enteredAmt <=0 ;

  if (_titleController.text.trim().isEmpty || amtInvalid || _selectedDate == null)
  {
    //error msg
    showDialog(
      context: context, 
      builder: (ctx)=> AlertDialog(
         shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20),
         ),

       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: 
        const Text('Invalid Input.',
        style: TextStyle(
          color: Color.fromARGB(255, 8, 3, 61),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        ),
        content: Text(
          'Please enter valid Title, Amount, Date or Category.',
          style: TextStyle(
            color: Color.fromARGB(255, 6, 3, 39),
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('OK'),
          )
        ],

    ),
    );
    return;
  }

  widget.onAddExpense(
    Expense (
    title: _titleController.text,
    amount: enteredAmt,
    date: _selectedDate!,
    category: _selectedCategory
  ),
  );
  Navigator.pop(context); 
}


//TextEditingController must be disposed or deleted if not in use
@override
void dispose() {
  _titleController.dispose();    //calls dispose on _titleController to delete it
  _amtController.dispose();
  super.dispose();
}


// When user submits the input or expense it is stored in _enteredTitle and then displayed in _savedInputTitle
//var _enteredTitle = '';
//to display the expense or new expense provided by user
//void _savedTitleInput(String inputValue)
//{
// _enteredTitle = inputValue;
//}
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      //to set the theme of context to green
    data: Theme.of(context).copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 27, 146, 116)),
      primaryColor: Color.fromARGB(255, 32, 156, 125),
    ),
    child: 
    Padding(
      padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
      child:
      Column(
        children: [
          TextField(  
            //use when you are using a controller to controll the input
            controller: _titleController,

            //use if you are using var to stored inputTitle
            //onChanged: _savedTitleInput,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),

          Row(
            children: [
              //amont textField
            Expanded(
            child:
             TextField
            (
             controller: _amtController,
             keyboardType: TextInputType.number,  //to takeonly number as input
              decoration: InputDecoration(
              prefixText: ' \₹ ',
              label: Text('Expense Amount'),
            ),
            ),
            ),
           
            const SizedBox(width: 16,),
            Expanded(
              child: 
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                
                // ! after _selectedDate forces
                // dart that the date should not be null when it is going to get formatted
                Text(_selectedDate == null ? 'Not Selected' : formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: _currentDatePicker,
                    icon: Icon(Icons.calendar_month),
                    color: Color.fromARGB(255, 32, 156, 125),
                  ),
                ],

              )
              ),
              

            ],
            ),

          SizedBox(height: 18,),
          Row(
            children: [

              DropdownButton(
              value: _selectedCategory,

                // Category is enum or list and dropdown requires dropped menu
                // map is used to transfer one type of value to another type

                items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                    value : category,   //value is used internally to know which option is selected by user
                  child: Text(category.name.toUpperCase()
                  ),
                  ),
                  )   //Convert the mapped values to list cause it is actually enum values 
                  .toList(),

                onChanged: (value){
                  if (value== null)
                  {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;    //if value is not null execute this code
                  });
                }
                ),

                const Spacer(),

              TextButton(
                onPressed: (){
                  //pops the new expense screen or cancel adding new expense
                  Navigator.pop(context);
                }, 
                 style: TextButton.styleFrom(
                 foregroundColor: const Color.fromARGB(255, 243, 33, 33), // set text color to blue
                ),

                child: Text('Cancel')
                ),
              ElevatedButton(
              onPressed: _submitExpenseData,          
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 32, 156, 125), // background color
              foregroundColor: Colors.white, // text color
                
           ),
           child: Text("Save")
           ),
            ],
          ),
          
        ],
      ),
      ),
    );
  }
  }