import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();  // here DateFormat is year ,month ,date formatted to month, date, year
class NewExpense extends StatefulWidget {

  const NewExpense({super.key,required this.onAddExpense,});

  final void Function(Expense expense) onAddExpense;

@override
  State<NewExpense> createState() {
  return _NewExpenseState();
}

}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';
  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle =  inputValue;    // here we don't need to wrap with setState because we are actually not using entered value anywhere in my UI code So the UI doesn't need to update just because we are storing the value entered by the user in some variable
  // }  // or
final _titleController = TextEditingController();
final _amountController = TextEditingController();
DateTime? _selectedDate; // here ? tells that selected date ever stores a value of type, DateTime or nothing, null
Category _selectedCategory = Category.leisure;  // this is default category

void _presentDatePicker() async{  // because  DateTime.now() is used to find current date so the type of showDatePicker is a future the we use async and await keyword for the future function
  final now = DateTime.now();
  final firstDate = DateTime(now.year - 1, now.month, now.day);  // now.year - 1 =  2023 - 1 = 2022
  final lastDate = DateTime.now();
  final pickedDate = await showDatePicker(    // here this( showDatePicker() ) is built-in function here we pass values in arguments it calls the showDatePicker class store this argument's values in class's variable
      context: context, initialDate: now, firstDate: firstDate, lastDate: lastDate
  );
  setState(
  () {
  _selectedDate = pickedDate;
  }
  );
}

void _showDialog(){
  if(Platform.isIOS){
  showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Invalid input'),
        content: const Text('Please make sure a valid title, amount, date and category was entered..'),
        actions: [ TextButton( onPressed: (){Navigator.pop(ctx);}, child: const Text('Okay'), ), ],
      )
  );
  }
  else {
    showDialog(    // here showDialog is a built in function and AlertDialog is a built in dialog widgets and it has couple of parameters like title, content, actions.
        context: context,
        builder:
            (ctx) {
          return AlertDialog(
            title: const Text('Invalid input'),
            content: const Text(
                'Please make sure a valid title, amount, date and category was entered..'),
            actions: [
              TextButton(
                onPressed: () { Navigator.pop(ctx); },
                child: const Text('Okay'),
              ),
            ],
          );
        }
    );
  }
}

void _submitExpenseData() {
  final enterAmount = double.tryParse(_amountController.text);   // here double.tryParse is a method built into dart TryParse takes a string as an input and then returns a double if it is able to convert that string to a number to a double or it returns null if it's not able to convert it S o using TryParse on a text like 'Hello' would yield null ed. tryParse('Hello') => null, tryParse('1.12') => 1.12
 final amountIsInvalid = enterAmount == null || enterAmount <= 0; // the logical operators ( &&, || ) are used to derive boolean values ( i.e., "true" or "false" ).
  if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){  // here we don't need to check the _selectedCategory because we also set a default Category which is Category.leisure
   _showDialog();
    return;
  }
  else {
    widget.onAddExpense(Expense(title: _titleController.text,amount: enterAmount,date: _selectedDate!,category: _selectedCategory)); // here _selectedDate! shows that we are sure that this won't be Null
     Navigator.pop(context);
       }
  }

@override
  void dispose() {
   _titleController.dispose();
   _amountController.dispose();
    super.dispose();
  }
  @override
  Widget build(context) {

  final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

  return LayoutBuilder(
      builder: (ctx, constrains) {
        final width = constrains.maxWidth;

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
          child: Column(
            children: [
              if(width >= 600)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Expanded(
                    child: TextFormField(
                      //  onChanged: _saveTitleInput,  // or
                      controller: _titleController,
                      maxLength: 50,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                    ),
                  ),

                  const SizedBox( width: 24,),

                  Expanded(
                    child: TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '\$ ',
                        label: Text('Amount'),
                      ),
                    ),
                  ),

                ],
                )
              else
              TextFormField(
                //  onChanged: _saveTitleInput,  // or
                controller: _titleController,
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),

              ),
              if(width >= 600)
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedCategory, // with that, we ensure that the currently selected value will be shown on the screen instead of showing this empty dropdown as it was the case before
                      items: Category.values.map(     // In Category here .values property gives a list with all the values that make up the enum // items now wants a list of dropdown menu item values // Now,values is a list of Enum values, a list of categories,therefore,and items wants a list of dropdown menu items. And we have to call map on this list to transform it from one type of value into another type of value. Now map wants a function which will be executed automatically by dart for every list item,And we will get the list item for which the function is currently executed as a input value automatically passed in by dart
                              (category){  // so here it will be a single category since this function will be invoked for all the category items
                            return DropdownMenuItem(  // And we want return our dropdown menu item here Now dropdown menu item in the end is a widget where we have to set the child parameter to another widget which simply defines what will be shown on the screen And here i will keep this simple and simply output a text widget here and the text value should be this category but category is of type category,so our Enum type here, and to convert this to a string that can be output with the text widget,we have to access the special name property that's made available by dart,along with a couple of other properties on all those Enum keys,all those Enum items.And name as a to uppercase method which convert all letters to capital letters
                              value: category,   // here value parameter will we the value that will be stored internally for every dropdown item. it will not be visible to the user,it's this child that's visible to the user but it will be stored internally and it will be this value that we get here (  onChanged: (value){   ) in this on changed function,whenever the user selects one of these dropdown items and here the value is the category itself So the specific Enum item that is mapped to a specific dropdown menu item
                              child: Text( category.name.toUpperCase() ),
                            );
                          }
                      ).toList(),  // here ( Category.values.map ) we have an iterable here in a place where a list is expected,and therefore,then we should call to list on the result of map
                      onChanged: (value){  // The onChanged Parameter as always, for these buttons must be set to a function that should be executed when the button is pressed Though, here,it really is a function that will get a value of type dynamics because the value that it will get here will simply be the value that has been selected from dropdown and it's of type dynamic because Flutter,right now,does not know which kind of items will display in this dropdown
                        if (value == null){
                          return;
                        }
                        else{
                          setState(() {
                            _selectedCategory = value;
                          });
                        }
                        // or            setState(() {
                        //                   _selectedCategory = myvalue;
                        //                     });
                      },
                    ),
                    const SizedBox(width: 24,),
                    Expanded(     // Date Picker
                      child: Row(  // it use to set the date format and icon of calender in Row
                        mainAxisAlignment: MainAxisAlignment.end,  // to set the content in the end
                        crossAxisAlignment: CrossAxisAlignment.center,// to set the content vertically in the center
                        children: [
                          Text( _selectedDate == null ? 'No date selected' : formatter.format(_selectedDate!) ), // here we add ! in the end it tells basically force dart to assume that this won't be null So with an exclamation mark after a possibly null value we tell dart this will never be null which we know with certainty here ' _selectedDate == null ' because we are checking for null equality here
                          // here if we select date year and month it sends to ' final formatter = DateFormat.yMd(); ' and show the date format like this month/date/year // here .format(_selectedDate!) = .yMd()

                          IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                    ),

                  ],
                )
              else
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '\$ ',
                        label: Text('Amount'),
                      ),


                    ),
                  ),
                  const SizedBox( width: 16, ),
                  Expanded(     // Date Picker
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,  // to set the content in the end
                      crossAxisAlignment: CrossAxisAlignment.center,// to set the content vertically in the center
                      children: [
                        Text( _selectedDate == null ? 'No date selected' : formatter.format(_selectedDate!) ), // here we add ! in the end it tells basically force dart to assume that this won't be null So with an exclamation mark after a possibly null value we tell dart this will never be null which we know with certainty here ' _selectedDate == null ' because we are checking for null equality here
                        // here if we select date year and month it sends to ' final formatter = DateFormat.yMd(); ' and show the date format like this month/date/year // here .format(_selectedDate!) = .yMd()

                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16,),
              if(width >= 600)
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text('Save Expense'),
                  ),
                ],
              )
              else
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory, // with that, we ensure that the currently selected value will be shown on the screen instead of showing this empty dropdown as it was the case before
                    items: Category.values.map(     // In Category here .values property gives a list with all the values that make up the enum // items now wants a list of dropdown menu item values // Now,values is a list of Enum values, a list of categories,therefore,and items wants a list of dropdown menu items. And we have to call map on this list to transform it from one type of value into another type of value. Now map wants a function which will be executed automatically by dart for every list item,And we will get the list item for which the function is currently executed as a input value automatically passed in by dart
                            (category){  // so here it will be a single category since this function will be invoked for all the category items
                          return DropdownMenuItem(  // And we want return our dropdown menu item here Now dropdown menu item in the end is a widget where we have to set the child parameter to another widget which simply defines what will be shown on the screen And here i will keep this simple and simply output a text widget here and the text value should be this category but category is of type category,so our Enum type here, and to convert this to a string that can be output with the text widget,we have to access the special name property that's made available by dart,along with a couple of other properties on all those Enum keys,all those Enum items.And name as a to uppercase method which convert all letters to capital letters
                            value: category,   // here value parameter will we the value that will be stored internally for every dropdown item. it will not be visible to the user,it's this child that's visible to the user but it will be stored internally and it will be this value that we get here (  onChanged: (value){   ) in this on changed function,whenever the user selects one of these dropdown items and here the value is the category itself So the specific Enum item that is mapped to a specific dropdown menu item
                            child: Text( category.name.toUpperCase() ),
                          );
                        }
                    ).toList(),  // here ( Category.values.map ) we have an iterable here in a place where a list is expected,and therefore,then we should call to list on the result of map
                    onChanged: (value){  // The onChanged Parameter as always, for these buttons must be set to a function that should be executed when the button is pressed Though, here,it really is a function that will get a value of type dynamics because the value that it will get here will simply be the value that has been selected from dropdown and it's of type dynamic because Flutter,right now,does not know which kind of items will display in this dropdown
                      if (value == null){
                        return;
                      }
                      else{
                        setState(() {
                          _selectedCategory = value;
                        });
                      }
                      // or            setState(() {
                      //                   _selectedCategory = myvalue;
                      //                     });
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text('Save Expense'),
                  ),
                ],)
            ],
          ),
        ),
      ),
    );
     }
  );


  }
}