import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/%20component/taskList.dart';

import '../api/apiClient.dart';

class canceledTaskList extends StatefulWidget {
  const canceledTaskList({super.key});

  @override
  State<canceledTaskList> createState() => _canceledTaskListState();
}

class _canceledTaskListState extends State<canceledTaskList> {
  List taskList=[];
  bool loading =true;

  @override
  initState(){
    callData();
    super.initState();
  }
  callData()async{
    var data= await listofTaskRequest('Canceled');
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
