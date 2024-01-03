
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem({super.key,required this.expense,});

  final Expense expense;  // here we write Expense not final List<Expense> expense; because here 'expense' returns separate Expense constructor not all list of Expense and we pass as a argument from previous file(expenses_list.dart) separate expenses[index] not list of all
                          // Don't see this := in short here we call Expense class's constructor
  @override
  Widget build(context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title,
            style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text('\$ ${expense.amount.toStringAsFixed(2)}'),  // if our amount is 12.3433 then we display 12.34 bu using .toStringAsFixed(2) method here 2 is a size of value after point
                const Spacer(),  // Spacer is simply a widget that can be used in any column or Row to tell Flutter that it should create a widget that takes up all the space it can get  between the other widget between which it is placed. So text gets all the space it needs to output the text and Row gets all the space it needs to output But spacer then will get always take all the remaining space
                 Row(
                   children: [
                     Icon(categoryIcons[expense.category]),  // here we call categoryIcons map which is in expense.dart and [expense.category] is a work as a key of this map and it returns the value of key
                     const SizedBox(width: 8,),
                     Text(expense.formattedDate), // it is a getter so we don't use formattedDate() if we use function the we write getformattedDate() // it calls Expense class's formattedDate() getter class which return a format of date like [date/year/month]
                 ],
                 ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}