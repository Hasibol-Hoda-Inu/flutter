import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

import '../../api/apiClient.dart';

class taskCreateScreen extends StatefulWidget {
  const taskCreateScreen({super.key});

  @override
  State<taskCreateScreen> createState() => _taskCreateScreenState();
}

class _taskCreateScreenState extends State<taskCreateScreen> {

  Map <String, String> formValues={
    'title':'',
    'description':'',
    'status':'New'
  };

  bool loading =false;

  inputOnChange(key, textValue){
    setState(() {
      formValues.update(key, (value) => textValue);
    });
  }

  formOnSubmission() async {
    if(formValues['title']!.isEmpty){
      errorToast('Try again');
    }
    else if(formValues['description']!.isEmpty){
      errorToast('write your description');
    }
    else{
      setState(() {
        loading=true;
      });
      bool res= await createNewTaskRequest(formValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
      setState(() {
        loading=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Stack(
        children: [
          ScreenBackGround(context),
          Container(
            alignment: Alignment.center,
            child: loading?
            (const Center(child: CircularProgressIndicator(),)):
            SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create your task',style: headText1(colorDarkBlue),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (textValue){
                      inputOnChange('title', textValue);
                    },
                    decoration: appInputDecoration('label'),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    textAlign: TextAlign.start,
                    maxLines: 10,
                    onChanged: (textValue){
                      inputOnChange('description', textValue);
                    },
                    decoration: appInputDecoration('Description'),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      style: appButtonStyle(),
                      onPressed: (){
                        formOnSubmission();
                      },
                      child: successButton('Create', String),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
