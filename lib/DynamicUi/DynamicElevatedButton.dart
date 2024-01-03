import 'package:flutter/material.dart';

// child: DynamicElevatedButton(
// () {Navigator.push(context, MaterialPageRoute(builder: (context) => firstPage(() { })));}, // or ElevatedpageRoute, // or Navigator.pop(btnContext);
// "Start",Colors.white,"Play Quiz",200,50,20,Colors.black).myElevatedButton() ),

class DynamicElevatedButton {
  DynamicElevatedButton(this.onTap, this.buttonName, this.nameColor, this.buttonHint, this.buttonWidth, this.buttonHeight, this.buttonRadius, this.buttonColor);
  final void Function() onTap;
  final String buttonName;
  final Color nameColor;
  final String buttonHint;
  final double buttonWidth;
  final double buttonHeight;
  final double buttonRadius;
  final Color buttonColor;


  Widget myElevatedButton() {
    return Tooltip(
      message: buttonHint,
    child:ElevatedButton(
       onPressed: onTap,
       child: Text(buttonName, style: TextStyle(color: nameColor), textAlign: TextAlign.center,),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight)),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        ),
        backgroundColor: MaterialStateProperty.all(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
        ),
      ),
    )
    );
  }
}
