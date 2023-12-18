import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

InputDecoration AppInputDecoration(label){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.greenAccent),
    ),
    fillColor: Colors.white70,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white70),
    ),
      border: const OutlineInputBorder(),
      labelText: label
  );
}

SvgPicture ScreenBackground(context){
  return SvgPicture.asset(
    'assets/images/download.svg',
        alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

DecoratedBox DropDownMenuStyle(child){
  return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: child,
          ),
  );
}

ButtonStyle AppButtonDefalultStyle(){
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),

  );
}