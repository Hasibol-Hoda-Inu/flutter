import 'package:get/get.dart';

class controller extends GetxController{
  var count =0.obs;
  increment(){
    count =count+1;
  }
}