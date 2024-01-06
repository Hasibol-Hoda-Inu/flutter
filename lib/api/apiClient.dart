import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_manager_with_rest_api/utility/utility.dart';

import '../style/style.dart';


var baseUrl='https://task.teamrabbil.com/api/v1';
var postHeader={'Content-Type':'application/json'};

Future<List> listofTaskRequest(status) async {
   var url=Uri.parse('$baseUrl/listTaskByStatus/$status');
   String? token= await readUserData('token');
   var headerWithToken={'Content-Type':'application/json', 'token':'$token'};
   var response= await http.get(url, headers: headerWithToken, );
   var resultCode= response.statusCode;
   var resultBody= jsonDecode(response.body);

   if(resultCode==200 && resultBody['status']=='success'){
     successToast('success');
     return resultBody['data'];
   }
   else{
     errorToast('Try again');
     return [];
   }
 }

loginRequest(formValues)async{
 try{
   var url=Uri.parse('$baseUrl/login');
   var postBody=jsonEncode(formValues);
   var response=await http.post(url, headers: postHeader, body: postBody);
   var resultCode= response.statusCode;
   var resultBody= jsonDecode(response.body);

   if(resultCode==200 && resultBody['status']=='success'){
     successToast('success');
     await writeUserData(resultBody);
     return true;
   }
   else{
     errorToast('Try again');
     return false;
   }
 }
 catch(error){
   errorToast('An error occurred$error');
 }
 }

 registrationRequest (formValues)async{
  try{
    var url=Uri.parse('${baseUrl}/registration');
    var postBody=jsonEncode(formValues);
    var response= await http.post(url, headers: postHeader, body: postBody);
    var resultCode= response.statusCode;
    var resultBody= jsonDecode(response.body);

    if(resultCode==200 && resultBody['status']=='success'){
      successToast('success');
      return true;
    }
    else{
      errorToast('Try again');
      return false;
    }
  } on http.ClientException catch(e){
    errorToast('HTTP client exception: $e');
  }
  catch(error){
    errorToast('An error occurred: $error');
  }
}

Future<bool> verifyEmail(email)async{
  var url=Uri.parse('$baseUrl/RecoverVerifyEmail/$email');
  var response= await http.get(url, headers: postHeader);
  var resultCode= response.statusCode;
  var resultBody= jsonDecode(response.body);

  if(resultCode==200 && resultBody['status']=='success'){
    successToast('success');
    await writeEmailVerification(email);
    return true;
  }
  else{
    errorToast('Try again');
    return false;
  }
}

Future<bool> verifyOTP(email, OTP)async{
  var url=Uri.parse('$baseUrl/RecoverVerifyOTP/$email/$OTP');
  var response= await http.get(url, headers: postHeader);
  var resultCode= response.statusCode;
  var resultBody= jsonDecode(response.body);

  if(resultCode==200 && resultBody['status']=='success'){
    successToast('Success');
    await writeOTPVerification(OTP);
    return true;
  }
  else{
    errorToast('Try again');
    return false;
  }
}

Future<bool> resetPass(formValues)async{
  var url=Uri.parse('$baseUrl/RecoverResetPass');
  var postBody=jsonEncode(formValues);
  var response= await http.post(url, headers: postHeader, body: postBody);
  var resultCode= response.statusCode;
  var resultBody= jsonDecode(response.body);

  if(resultCode==200 && resultBody['status']=='success'){
    successToast('success');
    return true;
  }
  else{
    errorToast('Try again');
    return false;
  }
}
