import 'dart:core' as prefix0;
import 'dart:core';
import 'package:flutter/material.dart';


class EditData extends StatefulWidget {
  final List list;
  final int index;
  
  EditData({this.list,this.index});
  
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

TextEditingController controllerActname;
TextEditingController controllerActdatestart;
TextEditingController controllerActdateend;
TextEditingController controllerActplace;

void editData(){
  
}

@override
  void initState() {
    controllerActname= new TextEditingController(text: widget.list[widget.index]['act_name']);
    controllerActdatestart= new TextEditingController(text: widget.list[widget.index]['act_datestart']);
    controllerActdateend= new TextEditingController(text: widget.list[widget.index]['act_dateend']);
    controllerActplace= new TextEditingController(text: widget.list[widget.index]['act_place']);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("EDIT DATA"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: controllerActname,
              decoration: new InputDecoration(
                hintText: "ชื่อกิจกรรม",
                labelText: "ชื่อกิจกรรม"
              ),
            ),
            new TextField(
              controller: controllerActdatestart,
              decoration: new InputDecoration(
                hintText: "วันที่เริ่ม",
                labelText: "วันที่เริ่ม"
              ),
            ),
            new TextField(
              controller: controllerActdateend,    
              decoration: new InputDecoration(
                hintText: "วันที่สิ้นสุด",
                labelText: "วันที่สิ้นสุด"
              ),
            ),new TextField(
              controller: controllerActplace,
              decoration: new InputDecoration(
                hintText: "สถานที่",
                labelText: "สถานที่"
              ),
            ),
            new Padding(padding: const EdgeInsets.all(10.0),),
            
            new RaisedButton(
              child: new Text("บันทึก"),
              color: Colors.blueAccent,
              onPressed: (){
                editData();
                Navigator.pop(context);
              },
            ) 
          ],
        ),
      )
    );
  }
}