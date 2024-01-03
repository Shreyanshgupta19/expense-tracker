import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/DynamicUi/DynamicDrawer.dart';
import 'package:expense_tracker/DynamicUi/DynamicGradientColor.dart';

// appBar: PreferredSize(
// preferredSize: Size.fromHeight(kToolbarHeight),
// child: DynamicAppBar('My Quizz App', Colors.red, Colors.purple),
// ),

class DynamicAppBar extends StatefulWidget{
  DynamicAppBar(this.title, this.startColor,this.endColor,{super.key});
 final String title;
 final startColor;
 final endColor;


  @override
  State<DynamicAppBar> createState() => _DynamicAppBarState();
}

class _DynamicAppBarState extends State<DynamicAppBar> {
  @override
  Widget build (context) {

    return Scaffold(

      appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: DynamicGradientColor(widget.startColor,widget.endColor).myGradientColors(),
// In case of statelesswidget we don't need to write 'widget.xyz' we can write directly 'xyz' ,
// because it is a property of statefulwidget
        ),
      ),
        centerTitle: true,
        title: Text(widget.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontFamily: 'font2',
        ),
        ),
      ),

    );
  }
}