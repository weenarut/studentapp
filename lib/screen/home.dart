import 'package:flutter/material.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {

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
                onPressed: (){},
                ),

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