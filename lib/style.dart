import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';



//Form input decoration starts here

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
//Form input decoration ends here


// BG svg style starts here
SvgPicture ScreenBackground(context){
  return SvgPicture.asset(
    'assets/images/download.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}
// BG svg style ends here

//Dropdown box style starts here
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
//Dropdown box style ends here


//Elevated button style starts here

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
//Elevated button style ends here

void errorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

void successToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

//Product screen styles starts here

SliverGridDelegateWithFixedCrossAxisCount productScreenGridView(){
  return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    mainAxisSpacing: 15,
    crossAxisSpacing: 5,
    mainAxisExtent: 270,
  );
}
