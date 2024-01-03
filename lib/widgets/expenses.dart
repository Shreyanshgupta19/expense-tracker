import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'chart/chart.dart';

class Expenses extends StatefulWidget{   // this class is shows the list of expenses and chart in ui
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

    final List<Expense> _registeredExpenses = [       // or  final _registeredExpenses = [             // here the list is returns Expense constructor that means return type of list is Expense in other word we can say that the list accepts Expense type values
      Expense(title: 'Flutter Course',amount: 19.99,date: DateTime.now(),category: Category.work ),
      Expense(title: 'Cinema',amount: 15.69,date: DateTime.now(),category: Category.leisure ),
    ];

    void _openAddExpenseOverlay() {  // here isScrollControlled: true, then modal overlay will actually take the full available height and therefore ensure that, of course, now we don't overlap any input
      showModalBottomSheet(
          useSafeArea: true,
          isScrollControlled: true,
          context: context,
          builder: (ctx){ return NewExpense(onAddExpense: _addExpense,); }
      );
    }

    void _addExpense(Expense expense) {      // Expense expense: in this Expense is a class and we are using our custom class as a type of expense variable
      setState(() {
        _registeredExpenses.add(expense);  // it add the expense in ' final List<Expense> _registeredExpenses = [ '
      });
    }

    void _removeExpense(Expense expense) {    // we store the element in Expense expense variable, like copy
      final expenseIndex = _registeredExpenses.indexOf(expense);  // it finds and stores the index of element which stores in Expense expense variable
      setState(() {
        _registeredExpenses.remove(expense);  // bool remove(Object? value)  // here we call remove and pass the expense that should be removed as a value
      });
      ScaffoldMessenger.of(context).clearSnackBars(); // we clear all existing info messages that we might have on the screen by using ScaffoldMessenger.of context. And there we can call clearSnackBars which removes any SnackBars So any info message we might still have on the screen
      ScaffoldMessenger.of(context).showSnackBar(     // This ScaffoldMessenger object has a 'of' method which we must execute,which wants context value which as you learned, is available in this class which is based on the state class Now this then gives us an instance of this ScaffoldMessenger And this ScaffoldMessenger thing offers us various utility functions and methods that help us with controlling the user interface and showing certain things on that interface most importantly we can call showSnackBar to show a show a so-called SnackBar which in the end is just a info message which is shown on the screen And showSnackBar wants a SnackBar value And this value can be created by using the built-in SnackBar class and instantiating this class here And SnackBar then needs at least a content which must be set to a widget Here we take Text widget here which name is 'Expense deleted.' But there is more that can be configured  about the SnackBar For example it also has a duration parameter that can be set and that wants a duration value, a value of type duration which can be create with the built-in duration constructor function.
          SnackBar(
            duration: const Duration(seconds: 3,),  // And this Duration class has various parameter that can be set to define a duration For example we can set it to three seconds here
            content: const Text('Expense deleted.'),
          action: SnackBarAction( label: 'Undo', onPressed: (){ setState( () { _registeredExpenses.insert(expenseIndex, expense); } ); } ),    // And we can also add an action to our SnackBar So not actions,but one single action and this must be of type SnackBar action, which is created by using the special SnackBarAction constructor So the SnackBarAction class and this then has also some parameters we can set like for example: label: which does not want a widget but a plain string, onPressed: it define the function that should be executed if this undo button is pressed on this SnackBar
              // insert method : With the insert method is which also adds an item to a list but we add a item to a list at specific position because i of course wanna bring back that expense that we removed in exactly the same place where it was before. So here we pass expenseIndex which is passed as a first value to insert and the second value is that expense which we deleted before. it was removed from list we can still access it down here though and it will then be brought back into the list
          ),
      );
    }

    @override
    Widget build(context) {

     final width = MediaQuery.of(context).size.width;
      // MediaQuery.of(context).size.height;

      Widget mainContent = const Center(child: Text('No expenses found, Start adding some!'),);

      if(_registeredExpenses.isNotEmpty) {
        mainContent = ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense,);
      }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600 ? Column(
        children: [

          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
          // or ExpensesList(expenses: _registeredExpenses),
        ],
      ) : Row(children: [
        Expanded( child: Chart(expenses: _registeredExpenses), ),
        Expanded(child: mainContent),
      ],),
    );
  }
}
