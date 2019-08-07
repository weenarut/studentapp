import 'package:flutter/material.dart';
import 'package:studentapp/screen/homestudent.dart';
import 'package:studentapp/screen/news.dart';
import 'package:studentapp/screen/regulation.dart';
import 'package:studentapp/screen/activityCalendar.dart';

class MainStudent extends StatefulWidget {
  @override
  _MainStudentState createState() => _MainStudentState();
}

class _MainStudentState extends State<MainStudent> {
  
  int _selectIndex = 0;
  final _layoutPage = [
    HomeStudent(),
    Regulation(),
    News(),
    ActivityCalendar(),
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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