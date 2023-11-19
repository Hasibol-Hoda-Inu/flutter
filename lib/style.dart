import'package:flutter/material.dart';

InputDecoration AppInputStyle(label){
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
    fillColor: Colors.white70,
    filled: false,
    labelText: label,
    border: OutlineInputBorder(),
  );

}

TextStyle HeadingText(){
  return TextStyle(
    fontSize: 24.0,
  );
}


ButtonStyle ElevatedButtonStyle(){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.fromLTRB(45, 15, 45, 15),
    textStyle: TextStyle(fontSize: 18),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    )
  );
}