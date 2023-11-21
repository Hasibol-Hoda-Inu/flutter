import 'package:flutter/material.dart';

InputDecoration inputFormStyle(label){
  return InputDecoration(
    contentPadding: EdgeInsets.all(12),
      labelText: label,
      border: OutlineInputBorder(),
  );
}

ButtonStyle elevatedButtonStyle(){
  return ElevatedButton.styleFrom(
      padding: EdgeInsets.all(13.6),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      )
  );
}


SizedBox sizebox50(child){
  return SizedBox(
    width: double.infinity,
    height: 55,
    child: Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: child,
    ),
  );
}