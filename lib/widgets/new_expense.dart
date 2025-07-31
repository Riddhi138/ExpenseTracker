import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget
{
  const NewExpense({super.key});

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

  //to pick a current date
void _currentDatePicker()
{
  //set current date or the date while u are creating/ adding expense
 final now = DateTime.now(); // add parentheses
 final firstDate = DateTime(now.year - 1, now.month, now.day);
 final lastdate = DateTime(now.year, now.month, now.day);

 // showDatePicker is the builtin function to set date
 showDatePicker(
   context: context,
   initialDate: now,
   firstDate: firstDate,
   lastDate: lastdate,
 );
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
      colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 32, 156, 125)),
      primaryColor: Color.fromARGB(255, 32, 156, 125),
    ),
    child: 
    Padding(
      padding: EdgeInsets.all(16),
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
                  const Text('Selected Date'),
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

          SizedBox(height: 16,),
          Row(
            children: [
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
           onPressed: ( ) 
           {
              print(_titleController.text);
              print(_amtController.text);
           },
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