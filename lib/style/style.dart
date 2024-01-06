import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed= Color.fromRGBO(231,28,36,1);
const colorDark= Color.fromRGBO(136,28,32,1);
const colorGreen= Color.fromRGBO(33,191,115,1);
const colorBlue= Color.fromRGBO(52,152,219,1);
const colorOrange= Color.fromRGBO(230,126,34,1);
const colorWhite= Color.fromRGBO(255,255,255,1);
const colorDarkBlue= Color.fromRGBO(44,62,80,1);
const colorLightGray= Color.fromRGBO(135,142,150,1);
const colorLight= Color.fromRGBO(211,211,211,1);

SizedBox taskCardsStyle(child){
  return SizedBox(
    width: double.infinity,
    child: Container(
      padding: EdgeInsets.all(12.0),
      child: child,
    ),
  );
}
TextStyle headText1(textColor){
  return TextStyle(
    fontSize: 28,
      fontWeight: FontWeight.w600,
    color: textColor,
  );
}

TextStyle headText6(textColor){
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: textColor,
  );
}

TextStyle buttonTextStyle(){
  return const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: colorWhite
  );
}

InputDecoration appInputDecoration(label){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorGreen, width: 1),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorWhite, width: 0.0),
    ),
    labelText: label,
    border: const OutlineInputBorder(),
  );
}

DecoratedBox appDropdownStyle(child){
  return DecoratedBox(
      decoration: BoxDecoration(
          color: colorWhite,
          border: Border.all(color: colorWhite, width: 1,),
          borderRadius: BorderRadius.circular(5)
      ),
    child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: child,
    ),
  );
}

SvgPicture ScreenBackGround(context){
  return SvgPicture.asset(
    'assets/images/bgnew.svg',
    fit: BoxFit.cover,
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
  );
}

ButtonStyle appButtonStyle(){
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
  );
}

Ink successButton(buttonText, String){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(buttonText, style: buttonTextStyle(),),
    ),
  );
}

void successToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

void errorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorLight,
      fontSize: 16.0
  );
}

PinTheme OTPboxStyle(){
  return PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    fieldWidth: 45,

    inactiveFillColor: Colors.transparent,
    inactiveColor: colorLightGray,
    inactiveBorderWidth: 0.5,

    activeFillColor: Colors.transparent,
    activeColor: colorGreen,
    activeBorderWidth: 0.5,

    errorBorderColor: colorRed,
    errorBorderWidth: 0.5,

    selectedFillColor: Colors.transparent,
  );
}