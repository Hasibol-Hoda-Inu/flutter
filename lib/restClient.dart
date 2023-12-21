import 'dart:convert';
import 'package:crud_app_with_rest_api/style.dart';
import 'package:http/http.dart' as http;

Future<bool> createProduct(FormValues) async {
  var url=Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
  var postBody=jsonEncode(FormValues);
  var postHeader={'Content-Type':'application/json'};
  var response= await http.post(url, headers: postHeader, body:postBody,);
  var resultCode=response.statusCode;
  var resultBOdy=jsonDecode(response.body);

  if(resultCode==200 && resultBOdy['status']=='success'){
    successToast('request success');
    return true;
  }
  else{
    errorToast('request failed try again');
    return false;
  }
}

Future<List> getProductInfo() async {
  var url=Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
  var getHeaders={'Content-Type':'application/json'};
  var response=await http.get(url, headers: getHeaders);
  var resultCode=response.statusCode;
  var resultBody=jsonDecode(response.body);

  if (resultCode==200 && resultBody['status']=='success'){
    successToast('Request success');
    return resultBody['data'];
  }
  else{
    errorToast('Request failed try again');
    return [''];
  }
}
