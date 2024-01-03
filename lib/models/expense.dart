import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';                     // here i simply describe which data structure an expense in this app should have So which kind of structure an expense should have
                                                     // here we have created a data model
final formatter = DateFormat.yMd();       // here DateFormat class is provided by intl package
                        // here yMd constructor function simply creates formatter object which we can then use to format dates So it's a utility object, we could say created with help of the DateFormat class and yMd() constructor function provided by the intl package
// And this yMd constructor function defines how the date will be formatted 'y = year , M = month, d = date'

const uuid = Uuid();
// here Uuid is a third party package and we call the constructor like this Uuid(); and here '.v4()' method is used to generate unique string id and we assign it with 'id'.

// enum variableName { name }
enum Category { food, travel, leisure, work }   // this value is not wrapped in '' or " " because it is not string values but nonetheless, this entire syntax here is recognized by dart and treats these values kind of like string values.
// enum is a keyword that allows us to create a custom type we could say, that could be named Category here, which simply is a combination of predefined allowed values. we define those defined values between {}.

const categoryIcons = {  // in map {key:value} // here we map custom Category's values to icons by using 'ClassName.value' syntax. and when we call for e.g. Category.food it already map its icon
  Category.food : Icons.lunch_dining, Category.travel : Icons.flight_takeoff, Category.leisure : Icons.movie, Category.work : Icons.work,
};

class Expense {                      // * class

  Expense({required this.title,required this.amount,required this.date,required this.category,}):id = uuid.v4(); // or Uuid().v4();  // * default constructor
  // or  Expense({ required this.title,required this.amount,required this.date }):id = uuid.v4();

  final String id;                   // * properties
  final String title;
  final double amount;
  final DateTime date;  // it carries the formatted 'date' value of formattedDate getter class
  final Category category; // it calls enum Category class
                                        // * behaviours/functions(methods)
  String get formattedDate {    // it is a getter function if we want to write simple function then we write like this:- ' String getformattedDate() { '
    return formatter.format(date);   // the format method is returning a string which containing the formatted version of that date // here date stores the formatted value(date/year/month) of formatter and we returns this date value to formattedDate getter class
  }

}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});  // default constructor
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)    // alternative(extra) constructor function
      : expenses = allExpenses.where(
          (expense){
            return expense.category == category;
          }
  ).toList();

  double get totalExpenses{   // properties: getter class
    double sum = 0;

    for(final expense in expenses){     // or  var i = 0; i < expenses.length; i++
      sum += expense.amount;    // or sum = sum + expense.amount;

    }
    return sum;
  }
}