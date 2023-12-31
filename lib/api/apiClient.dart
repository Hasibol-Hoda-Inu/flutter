import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_manager_with_rest_api/style/style.dart';


Map <String, String> task={'title':'', 'description':'','status':''};


Future<bool> createTask(task) async {
  var url=Uri.parse('https://task.teamrabbil.com/api/v1/createTask');
  var postBody =jsonEncode(task);
  var postHeader={'contentType':'application/json'};
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

