import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// In Container Case
// decoration: BoxDecoration(
// gradient: DynamicGradientColor(widget.color1, widget.color2).myGradientColors(),
// ),

// In App Bar Case
// flexibleSpace: Container(
// decoration: BoxDecoration(
// gradient: DynamicGradientColor(widget.startColor,widget.endColor).myGradientColors(),
// // In case of statelesswidget we don't need to write 'widget.xyz' we can write directly 'xyz' ,
// // because it is a property of statefulwidget
// ),
// ),

// In Normal Case
// gradient: DynamicGradientColor(widget.startColor,widget.endColor).myGradientColors(),

class DynamicGradientColor {
    DynamicGradientColor(this.color1, this.color2);
    final Color color1;
    final Color color2;
    LinearGradient myGradientColors() {  // here function name is myGradientColors and it returns LinearGradient
        return LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                color1,
                color2,
            ],
        );
    }
}
