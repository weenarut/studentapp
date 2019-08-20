import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

TextEditingController controllerActname = new TextEditingController();
TextEditingController controllerActdatestart = new TextEditingController();
TextEditingController controllerActdateend = new TextEditingController();
TextEditingController controllerActplace = new TextEditingController();
DateTime date1;

void addData(){
  var url="http://weenarutclass.000webhostapp.com/bcstudent/adddata.php";

  http.post(url, body:{
    "Actname": controllerActname.text,
    "Actdatestart" :controllerActdatestart.text,
    "Actdateend" : controllerActdateend.text,
    "Actplace" : controllerActplace.text,
  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("ADD DATA"),), 
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
            DateTimePickerFormField(
              inputType: InputType.both,
              format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
              editable: false,
              decoration: InputDecoration(
                  labelText: 'DateTime',
                  hasFloatingPlaceholder: false
              ),
              onChanged: (dt) {
                setState(() => date1 = dt);
                print('Selected date: $date1');
              },
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
                addData();
                Navigator.pop(context);
              },
            ) 
          ],
        ),
      )    
    );
  }
}