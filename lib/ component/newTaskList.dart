import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/%20component/taskList.dart';

import '../api/apiClient.dart';
import '../style/style.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {
  List taskList=[];
  bool loading =true;
  String Status= "New";

  taskDeletePopup(id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete?'),
          content: const Text("Once deleted, you can't get it back"),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            OutlinedButton(
              onPressed: () async {
                Navigator.pop(context);
                setState(() {
                  loading = true;
                });
                await taskDeleteRequest(id);
                await callData();
                setState(() {
                  loading = false;
                });
              },
              child: const Text('Yes'),
            )
          ],
        );
      },
    );
  }

  statusChange(id){
    showModalBottomSheet(context: context,
        builder: (context){
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState){
            return Container(
              padding:  const EdgeInsets.all(30),
              height: 460,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile(title: const Text('New'), value: 'New', groupValue: Status,
                      onChanged: (value){setState((){Status=value.toString();});}
                  ),
                  RadioListTile(title: const Text('Progress'), value: 'Progress', groupValue: Status,
                      onChanged: (value){setState((){Status=value.toString();});}
                  ),
                  RadioListTile(
                      title: const Text('Completed'), value: 'Completed', groupValue: Status,
                      onChanged: (value){setState((){Status=value.toString();});
                      }
                  ),
                  RadioListTile(title: const Text('Canceled'), value: 'Canceled', groupValue: Status,
                      onChanged: (value){setState((){Status=value.toString();});}
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    child: ElevatedButton(
                      style: appButtonStyle(),
                      onPressed: () async {
                        Navigator.pop(context);
                        setState(() {
                          loading = true;
                        });
                        await taskUpdateRequest(id,Status);
                        await callData();
                        setState(() {
                          loading = false;
                          Status="New";
                        });

                      },
                      child: successButton('Confirm', String),
                    ),
                  )
                ],
              ),
            );
          }
      );
        }
    );
  }

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
    return loading?(const Center(child: CircularProgressIndicator(),)):RefreshIndicator(
        onRefresh: ()async{
          await callData();
        },
        child: taskListView(taskList, taskDeletePopup, statusChange),
    );
  }
}
