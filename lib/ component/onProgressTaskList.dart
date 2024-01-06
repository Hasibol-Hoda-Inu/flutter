import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/%20component/taskList.dart';

import '../api/apiClient.dart';

class onPregressTaskList extends StatefulWidget {
  const onPregressTaskList({super.key});

  @override
  State<onPregressTaskList> createState() => _onPregressTaskListState();
}

class _onPregressTaskListState extends State<onPregressTaskList> {
  List taskList=[];
  bool loading =true;

  @override
  initState(){
    callData();
    super.initState();
  }
  callData()async{
    var data= await listofTaskRequest('Progress');
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
