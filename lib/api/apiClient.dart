import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_manager_with_rest_api/style/style.dart';


var baseUrl={'https://task.teamrabbil.com/api/v1/'};
var postHeader={'contentType':'application/json'};

Future<bool> createTask(task) async {
  var url=Uri.parse('$baseUrl/createTask');
  var postBody =jsonEncode(task);
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

// Future<bool> login(formValues)async{
//   var url=Uri.parse('$baseUrl/login');
//   var postBody=jsonEncode(formValues);
//   var response=await http.post(url, headers: postHeader, body: postBody);
//   var resultCode= response.statusCode;
//   var resultBody= jsonDecode(response.body);
//
//   if(resultCode==200 && resultBody['status']=='success'){
//     successToast('success');
//     return true;
//   }
//   else{
//     errorToast('Try again');
//     return false;
//   }
// }

Future<bool> login(formValues) async {
  try {
    final url = Uri.parse('$baseUrl/login');
    final postBody = jsonEncode(formValues);
    final response = await http.post(url, headers: postHeader, body: postBody);

    if (response.statusCode == 200) {
      final resultBody = jsonDecode(response.body);
      if (resultBody['status'] == 'success') {
        successToast('Login successful');
        return true;
      } else {
        errorToast('Login failed: ${resultBody['message'] ?? 'Unknown error'}'); // Use error message from server if available
        return false;
      }
    } else {
      errorToast('Request failed with status code: ${response.statusCode}');
      return false;
    }
  } catch (error) {
    errorToast('An error occurred: $error');
    return false;
  }
}


Future<bool> registration (formValues)async{
  var url=Uri.parse('$baseUrl/registration');
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

Future<bool> verifyEmail(email)async{
  var url=Uri.parse('$baseUrl/RecoverVerifyEmail/$email');
  var response= await http.get(url, headers: postHeader);
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

Future<bool> verifyOTP(email, code)async{
  var url=Uri.parse('$baseUrl/RecoverVerifyOTP/$email/$code');
  var response= await http.get(url, headers: postHeader);
  var resultCode= response.statusCode;
  var resultBody= jsonDecode(response.body);

  if(resultCode==200 && resultBody['status']=='success'){
    successToast('Success');
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
