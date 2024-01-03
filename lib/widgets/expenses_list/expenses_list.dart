import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget { 
  const ExpensesList({super.key,required this.expenses, required this.onRemoveExpense});
  
  final List<Expense> expenses;  // here we define the type of expenses and store entire Expense's list in expenses variable which is present in expense.dart file
                                 // in other words we create that list, we of course must make sure that the ExpansesList widget class here accepts this list of expenses as input
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(context) {
    return ListView.builder(         // if we have a list of unclear length that could potentially get quit length as it is the case here, for this ExpensesList users could add 100 or 1000 expenses when the app is running
                                     // so when we have a list of unknown length that will potentially get very long, column is not ideal because with column, all the widgets that you add to it will be created behind the scenes by flutter so in this case we use ListView widget this is automatically scrollable but it is not ideal because there have a lot of items that won't be visible initially
                                     // but here we should not use list like this but use a special constructor that offered by it  the builder constructor function it should have a scrollable list  but it should build, create those list items only when they are visible or about to become visible

      itemCount: expenses.length,    // In expenses.length we count total number elements(constructors) in Expense'S list // itemCount defines how many list items will be rendered eventually // if itemCount is two because if we have two items in our list then itemBuilder's anonymous function here will be called twice and here initially index is 0 for the first item because list indexes in dart start at 0 and it will be 1 for the second item therefore
        itemBuilder: (ctx, index) {      // here we pass (context, index), in anonymous function // {required Widget? Function(BuildContext, int) itemBuilder} // Type: Widget? Function(BuildContext, int) that means this anonymous function returns a Widget
      //  return Text(expenses[index].title);  // here we point title which present in Expense constructor in Expense list // we can access a specific expense by index by using []
      return Dismissible(  // By the using of this widget we can wrap around list items that should be swipe-able or that should be dismissible, remove-able to be precise.
         background: Container(
           color:  Theme.of(context).colorScheme.error.withOpacity(0.75),// or Colors.red,
           margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal,),
           child: Center(
             child: Icon(Icons.delete,color: Theme.of(context).cardColor,),
           ),
          ),
          key: ValueKey(expenses[index]),  // In Flutter, the Key property is used to uniquely identify widgets. It helps Flutter understand how the widget tree has changed over time. // Here, ValueKey is being used to create a key based on the value of expenses[index]. This is important for the Dismissible widget because it needs a way to identify each item uniquely. When an item is dismissed, Flutter needs to know which item was dismissed, and the key helps in achieving that.
          onDismissed: (direction){      //  The onDismissed property takes a function that will be called when the item is dismissed. It provides a direction parameter that indicates the direction in which the item was dismissed (e.g., left or right).  // In this case, the provided function (onRemoveExpense) is called when the item is dismissed. It's passing expenses[index] as an argument, indicating which expense item should be removed from the list. The onRemoveExpense function is likely designed to handle the logic of removing the corresponding expense from the data source.
              onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expense:expenses[index]),  // This is specifying the child widget that will be wrapped by the Dismissible widget. In this case, it's an ExpenseItem widget, and it's passing the corresponding expense from the list (expenses[index]) to that widget.
      );
        }
    );
  }
}
