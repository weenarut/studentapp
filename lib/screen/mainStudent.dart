import 'package:flutter/material.dart';
import 'package:studentapp/main.dart';
import 'package:studentapp/screen/homestudent.dart';
import 'package:studentapp/screen/news.dart';
import 'package:studentapp/screen/regulation.dart';
import 'package:studentapp/screen/activity.dart';


class MainStudent extends StatefulWidget {
  @override
  _MainStudentState createState() => _MainStudentState(username);
}

class _MainStudentState extends State<MainStudent> {

  _MainStudentState(this.username);
  final String username; 

  int _selectIndex = 0; 
  final _layoutPage = [
    HomeStudent(),
    Regulation(),
    News(),
    Activity(),
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Student'),actions: <Widget>[
            IconButton(
              onPressed: () { 
                Navigator.pushReplacementNamed(context, '/LoginForm');
              },
              icon: Icon(Icons.lock_open),
            )
          ],
      ),
      body: _layoutPage.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('หน้าหลัก'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_headline),
            title: Text('ระเบียบข้อบังคับ'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            title: Text('ข่าวสาร'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('ปฏิทินกิจกรรม'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectIndex,
        onTap: _onTabItem,
      ),
    );
  }
}