import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/%20component/taskList.dart';

import '../api/apiClient.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {
  List taskList=[];
  bool loading =true;

  @override
  initState(){
    callData();
    super.initState();
  }
  callData()async{
    var data= await listofTaskRequest('New');
    setState(() {
      loading=false;
      taskList=data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading?(Center(child: CircularProgressIndicator(),)):RefreshIndicator(
        onRefresh: ()async{
          await callData();
        },
        child: taskListView(taskList),
    );
  }
}
