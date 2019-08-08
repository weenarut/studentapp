import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import './detail.dart';
import './adddata.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {


  Future<List> getData() async {
    final response = await http.get("http://weenarutclass.000webhostapp.com/bcstudent/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: new AppBar (
           title: new Text("กิจกรรม"),),
         floatingActionButton: new FloatingActionButton(
           child: new Icon(Icons.add),
           onPressed: ()=>Navigator.of(context).push(
             new MaterialPageRoute(
               builder: (BuildContext context)=> new AddData(),
             )
           ),
         ),
         
         body: new FutureBuilder<List>(
           future: getData(),
           builder: (context,snapshot){
             if(snapshot.hasError) print(snapshot.error);

             return snapshot.hasData 
               ? new Itemlist(
                 list: snapshot.data,)
             : new Center (child: new CircularProgressIndicator(),); 
             },
           ),    
    );
  }
}

class Itemlist extends StatelessWidget {

  final List list;
  Itemlist({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context,i){
        return new Container(
          padding: const EdgeInsets.all(10.0),
                  child: new GestureDetector(
                    onTap: ()=>Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=> new Detail(list:list , index: i,)
                      )
                    ),
                                      child: new Card(
                      child: new ListTile(
              title: new Text(list[i]['act_name']),
              leading : new Icon(Icons.widgets),
              subtitle: new Text("วันที่ ${list[i]['act_datestart']}"),
            ),
          ),
                  ),
        );
      },
    );
  }
}