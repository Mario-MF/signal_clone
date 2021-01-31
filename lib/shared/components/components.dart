import 'package:flutter/material.dart';

Widget defultButton(
    {@required text,
      color = Colors.blueAccent,
      @required function,
      double r = 5.0,
      textColor = Colors.white,
      height,
      double width = double.infinity,
      double fz = 15.0,
      toUpper = true,
      fontWeight = FontWeight.bold,
      borderColor= Colors.blueAccent}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        color: color,
        borderRadius: BorderRadius.circular(r),
      ),
      child: FlatButton(
        onPressed: function,
        child: Text(
          toUpper ? text.toString().toUpperCase() : text.toString(),
          style: TextStyle(
            color: textColor,
            fontSize: fz,
            fontWeight: fontWeight,
          ),
        ),
        color: color,
      ),
    );

void navigateTo({context, widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));