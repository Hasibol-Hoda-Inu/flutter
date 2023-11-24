import 'package:flutter/material.dart';

InputDecoration inputFormStyle(label){
  return InputDecoration(
    contentPadding: const EdgeInsets.all(12),
      labelText: label,
      border: const OutlineInputBorder(),
  );
}

ButtonStyle elevatedButtonStyle(){
  return ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(13.6),
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      )
  );
}


SizedBox sizebox50(child){
  return SizedBox(
    width: double.infinity,
    height: 55,
    child: Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: child,
    ),
  );
}