import 'package:flutter/material.dart';
import 'widgets/expenses.dart';
import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 9, 125),
);

// void main() {
  // WidgetsFlutterBinding.ensureInitialized();  // here we locking the device Orientation
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then(
  //     (fn){
  //       runApp(
  //           MaterialApp(
  //             debugShowCheckedModeBanner: false,
  //             darkTheme: ThemeData.dark().copyWith(
  //               useMaterial3: true,
  //               colorScheme: kDarkColorScheme,
  //               cardTheme: const CardTheme().copyWith(
  //                 color: kDarkColorScheme.secondaryContainer,
  //                 margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8,),
  //               ),
  //               elevatedButtonTheme: ElevatedButtonThemeData(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: kDarkColorScheme.primaryContainer,  // or Colors.white,
  //                   foregroundColor: kDarkColorScheme.onSecondaryContainer,
  //                 ),
  //               ),
  //             ),
  //             theme: ThemeData().copyWith(   // or ThemeData(useMaterial3: true,.......),
  //               useMaterial3: true,
  //               scaffoldBackgroundColor: Colors.white,
  //               colorScheme: kColorScheme,
  //               appBarTheme: const AppBarTheme().copyWith(
  //                 backgroundColor: kColorScheme.onPrimaryContainer,  // or Colors.white10,   // Background color of the app bar
  //                 foregroundColor: kColorScheme.primaryContainer,    // or Colors.white10,   // Text color of the app bar
  //               ),
  //               textTheme: ThemeData().textTheme.copyWith(
  //                 titleLarge: TextStyle(    // AppBar text
  //                   fontWeight: FontWeight.bold,
  //                   color: kColorScheme.onSecondaryContainer, // if we do like this Colors.white it does not change appbar text color because we have already set appBar color in appBarTheme's foregroundColor
  //                   fontSize: 18,
  //                 ),),
  //               elevatedButtonTheme: ElevatedButtonThemeData(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: kColorScheme.primaryContainer,  // or Colors.white,  // Background color of elevated buttons
  //                 ),
  //               ),
  //               cardTheme: const CardTheme().copyWith(
  //                 color: kColorScheme.secondaryContainer,      // Background color of cards
  //                 margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8,),
  //               ),
  //             ),
              // themeMode: ThemeMode.system, // this is already default so we don't need to set this
        //       home: const Expenses(),
        //     )
        // );
       // }
       //    );
//
// }
void main() {
  // WidgetsFlutterBinding.ensureInitialized();  // here we locking the device Orientation
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then(
  //     (fn){
        runApp(
            MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData.dark().copyWith(
                useMaterial3: true,
                colorScheme: kDarkColorScheme,
                cardTheme: const CardTheme().copyWith(
                  color: kDarkColorScheme.secondaryContainer,
                  margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8,),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kDarkColorScheme.primaryContainer,  // or Colors.white,
                    foregroundColor: kDarkColorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              theme: ThemeData().copyWith(   // or ThemeData(useMaterial3: true,.......),
                useMaterial3: true,
                scaffoldBackgroundColor: Colors.white,
                colorScheme: kColorScheme,
                appBarTheme: const AppBarTheme().copyWith(
                  backgroundColor: kColorScheme.onPrimaryContainer,  // or Colors.white10,   // Background color of the app bar
                  foregroundColor: kColorScheme.primaryContainer,    // or Colors.white10,   // Text color of the app bar
                ),
                textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(    // AppBar text
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer, // if we do like this Colors.white it does not change appbar text color because we have already set appBar color in appBarTheme's foregroundColor
                    fontSize: 18,
                  ),),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kColorScheme.primaryContainer,  // or Colors.white,  // Background color of elevated buttons
                  ),
                ),
                cardTheme: const CardTheme().copyWith(
                  color: kColorScheme.secondaryContainer,      // Background color of cards
                  margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8,),
                ),
              ),
              // themeMode: ThemeMode.system, // this is already default so we don't need to set this
              home: const Expenses(),  // expenses.dart
            )
        );
       // }
       //    );

}
// main.dart <-> expense.dart <-> expenses.dart <-> expenses_list <-> expenses_item.dart <-> new_expense.dart......
