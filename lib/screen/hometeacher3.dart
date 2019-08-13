import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './adddata.dart';
import './news.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter GridView',
      home: new Home(),
      theme: new ThemeData(primaryColor: Colors.deepOrange),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    var spacecrafts = ["ข้อมูลส่วนตัว","ตารางสอน","จัดการข่าวสาร","จัดการกิจกรรม","นัดหมาย","สถิติ รายงาน"];
    var myGridView = new GridView.builder(
      itemCount: spacecrafts.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0,left: 10.0),
              child: new Text(spacecrafts[index]),
            ),
          ),
          onTap: () {
            print (spacecrafts[index]); 


            switch (spacecrafts[index]) {
                      case "ข้อมูลส่วนตัว":
                        {
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) => new AddData(),
                            ),
                          );
                        }
                        break;

                      case "ตารางสอน":
                        {
                           print (spacecrafts[index]);
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) => new News(),
                            ),
                          );;
                        }
                        break;

                      default:
                        {
                          //statements;
                        }
                        break;
                    };


  

        /*    showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("GridView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  content: new Text( spacecrafts[index]),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ));*/
          },
        );
      },
    );

    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Flutter GridView")
      ),
      body: myGridView,
    );
  }
}
void main() {
  runApp(new MyApp());
}