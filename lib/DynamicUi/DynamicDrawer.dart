import 'package:flutter/material.dart';
import 'package:expense_tracker/DynamicUi/DynamicGradientColor.dart';


// drawer: DynamicDrawer(" Something Hint or "" "),
// appBar: AppBar(
// iconTheme: IconThemeData(
// color: Colors.white, ), // Set the color of the drawer icon
// ),

class DynamicDrawer extends StatefulWidget {

  DynamicDrawer(this.drawerHint,{super.key});
  final String drawerHint;

  final  startColor = Colors.purple;
  final endColor = Colors.red;
  @override
  State<DynamicDrawer> createState() {
    return _DynamicDrawerState();
  }
}

class _DynamicDrawerState extends State<DynamicDrawer> {

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: widget.drawerHint,
        child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: DynamicGradientColor(widget.startColor,widget.endColor).myGradientColors(),
            ),
            child: Center(
              child: Text(
                'My Quizz App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'font2',
                ),
              ),
            ),
          ),
          InkWell(
              onTap: (){
                // Navigator.pop(context, homePage());
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => homePage()),
                // );
                Navigator.pop(context);
                },
            child: Container(
              height: 70,
              child: Row(
               children: [
               Icon(Icons.home,color: Colors.black,),
               Text('Home',style: TextStyle(color: Colors.black),),
                         ],
                 ),

            ),
          ),
          InkWell(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context){return AllGroupsScreen();}));
            },
            child: Container(
              height: 70,
              child: Row(
                children: [
                  Icon(Icons.settings,color: Colors.black,),
                  Text('Settings',style: TextStyle(color: Colors.black),),
                ],
              ),

            ),
          ),

          // Add more items as needed
        ],
      ),
     ),
    );
  }
}
