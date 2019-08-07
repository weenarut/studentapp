import 'package:flutter/material.dart';
  
class HomeStudent extends StatefulWidget {
  @override
  _HomeStudentState createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudent> with SingleTickerProviderStateMixin {

  TabController controller;
  
  @override
  void initState() {
    controller= new TabController(vsync: this,length:4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      appBar: new AppBar(
        title : Text('Welcome to Student Page',textScaleFactor: 1.0,),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              child: Container(
                child: Text(
                  'หน้าหลัก',
                  style: TextStyle(color: Colors.white,fontSize: 10.0),
                ),
              ),
            ),
            Tab(
              child: Container(
                child: Text(
                  'ระเบียบ ข้อบังคับ',
                  style: TextStyle(color: Colors.white,fontSize: 10.0),
                ),
              ),
            ),
            Tab(
              child: Container(
                child: Text(
                  'ข่าวประกาศ',
                  style: TextStyle(color: Colors.white,fontSize: 10.0),
                ),
              ),
            ),
            Tab(
              child: Container(
                child: Text(
                  'กิจกรรม',
                  style: TextStyle(color: Colors.white,fontSize: 10.0),
                ),
              ),
            ),
          
         ],
        ),
      ),
      
      );
     
  } 
}