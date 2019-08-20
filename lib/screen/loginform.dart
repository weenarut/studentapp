import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:studentapp/screen/register.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg='';

  Future<List> _login() async {
    final response = await http.post(
        'https://weenarutclass.000webhostapp.com/bcstudent/checkuser.php',
        body: {
          "username": user.text,
          "password": pass.text,
        });

    var datauser = json.decode(response.body);

    if (datauser.length == 0){
      setState(() {
        msg='Login Fail';
      });
    } else {
      if (datauser[0]['type']=='S'){
        Navigator.pushReplacementNamed(context, '/mainStudent');
      } else if (datauser[0]['type']=='T'){
        Navigator.pushReplacementNamed(context, '/mainTeacher');
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(2.0),
        margin: EdgeInsets.all(30.0),
        child : Column(
          children: <Widget>[
            LogoImageAsset(),
            
            Padding(
              padding: EdgeInsets.only(top: 5,bottom: 5),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle ,
                decoration : InputDecoration(
                  labelText: 'ชื่อผู้ใช้',
                  hintText: 'ป้อนชื่อผู้ใช้',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )                
                ),
                )),

              Padding(
                padding: EdgeInsets.only(top: 5,bottom: 5),
                child:TextField(
                style: textStyle,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration : InputDecoration(
                  labelText: 'รหัสผ่าน',
                  hintText: 'ป้อนรหัสผ่าน',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )                
                ),
                )),

              Row(children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.pinkAccent,
                    textColor: Colors.white,
                    child:  Text('เข้าสู่ระบบ',textScaleFactor: 1.5,style: textStyle,),
                    onPressed: (){
                         _login(); 
                    },
                  ) ,
                ),

                Container(width: 25,),

                Expanded(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.pinkAccent,
                    textColor: Colors.white,
                    child:  Text('ยกเลิก',textScaleFactor: 1.5,style: textStyle,),
                    onPressed: (){

                    },
                  ) ,
                )
              ],),

              FlatButton(child: 
                Text('ลงทะเบียนผู้ใช้'),
                onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=> new AddData()));
                },
                ),

                Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)

          ],
        ) ,),
      
    );
  }
}

class LogoImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/bc_logo.png');
    Image image =Image(image:assetImage, width: 150.0,height: 150.0,);
    return Container(child: image, margin: EdgeInsets.all(20.0),);
  }
}