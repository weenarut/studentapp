import 'package:flutter/material.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import './activity.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

void deleteData(){
  var url="http://weenarutclass.000webhostapp.com/bcstudent/deletedata.php";
  http.post(url, body: {
    'Act_id': widget.list[widget.index]['act_id']
  });
}

void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure want to delete'${widget.list[widget.index]['act_name']}'"),
      actions: <Widget> [
        new RaisedButton(
          child: new Text("OK DETETE!",style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Activity(),
                 )
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL",style: new TextStyle(color: Colors.black),),
          color: Colors.green,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],    
    );

    showDialog(context: context, child: alertDialog);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['act_name']}")),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(widget.list[widget.index]['act_name'],style: new TextStyle(fontSize: 20.0),),
                new Text("วันที่เริ่ม ${widget.list[widget.index]['act_datestart']}",style: new TextStyle(fontSize: 18.0),),
                new Text("วันที่สิ้นสุด ${widget.list[widget.index]['act_dateend']}",style: new TextStyle(fontSize: 18.0),),
                new Text("เวลาเริ่ม ${widget.list[widget.index]['act_timestart']}",style: new TextStyle(fontSize: 18.0),),
                new Text("เวลาสิ้่นสุด ${widget.list[widget.index]['act_timeend']}",style: new TextStyle(fontSize: 18.0),),
                new Text("สถานที่ ${widget.list[widget.index]['act_place']}",style: new TextStyle(fontSize: 18.0),),
                new Text("จำนวน ${widget.list[widget.index]['rec_amt']}",style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("แก้ไขข้อมูล"),
                      color: Colors.green,
                      onPressed: ()=> Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=> new EditData(list: widget.list,index: widget.index,),
                        )
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("ลบข้อมูล"),
                      color: Colors.red,
                      onPressed: ()=>confirm(),
                     ),
                  ],)
                
                ],) ,),
        ),)
    );
  }
}