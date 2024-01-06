import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/%20component/taskList.dart';

import '../api/apiClient.dart';

class completedTaskList extends StatefulWidget {
  const completedTaskList({super.key});

  @override
  State<completedTaskList> createState() => _completedTaskListState();
}

class _completedTaskListState extends State<completedTaskList> {
  List taskList=[];
  bool loading =true;

  @override
  initState(){
    callData();
    super.initState();
  }
  callData()async{
    var data= await listofTaskRequest('Completed');
    setState(() {
      loading=false;
      taskList=data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return loading?(Center(child: CircularProgressIndicator(),)):RefreshIndicator(
        onRefresh: () async {
          await callData();
        },
        child: taskListView(taskList),
    );
  }
}
