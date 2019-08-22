import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studentapp/model/api.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

TextEditingController controllerStudentId = new TextEditingController();
TextEditingController controllerPassword = new TextEditingController();
TextEditingController controllerStudentName = new TextEditingController();
TextEditingController controllerTel = new TextEditingController();


void addData(){
  var url= BaseUrl.register;

  http.post(url, body:{
    "studentid": controllerStudentId.text,
    "password" : controllerPassword.text,
    "studentname" :controllerStudentName.text,
    "tel" : controllerTel.text,
  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("ลงทะเบียน"),), 
      body: Container(
          child : new SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new TextField(
                controller: controllerStudentId,
                decoration: new InputDecoration(
                  hintText: "รหัสนักศึกษา",
                  labelText: "รหัสนักศึกษา"
                ),
              ),
              
              new TextField(
                controller: controllerPassword,
                obscureText: true,
                decoration: new InputDecoration(
                  hintText: "รหัสผ่าน",
                  labelText: "รหัส่ผ่าน"
                ),
              ),
              new  TextField(
                controller: controllerStudentName,
                decoration: new InputDecoration(
                  hintText: "ชื่อนักศึกษา",
                  labelText: "ชื่อนักศึกษา"
                ),
              ),
             
             new Padding(padding: const EdgeInsets.all(10.0),),
             TextField(
                controller: controllerTel,
                decoration: new InputDecoration(
                  hintText: "เบอร์โทร",
                  labelText: "เบอร์โทร่"
                ),
              ),
              new Padding(padding: const EdgeInsets.all(10.0),),
              
              new RaisedButton(
                child: new Text("บันทึก"),
                color: Colors.blueAccent,
                onPressed: (){
                  addData();
                  Navigator.pop(context);
                },
              ) 
            ],
          ),
        ),
      )    
    ),);
  }
}