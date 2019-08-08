import 'package:flutter/material.dart';

class HomeTeacher extends StatefulWidget {
  @override
  _HomeTeacherState createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Computer'),
        actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: (){},
        )
        ], 
      ),
      body: ListView(
        children: <Widget>[
          Profile(),
          Divider(),
          TeacherMenu(),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Container(
          width: 50.0,
          height: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://png.pngtree.com/png-clipart/20190603/original/pngtree-business-cartoon-character-elements-png-image_655201.jpg"
              )
            ),
          ),
        ),
        title: Text(
          'อาจารย์วีนารัตน์ แสวงกิจ',
           style: TextStyle(fontWeight:FontWeight.bold),
        ),
        
      ),
      
    );
  }
}

class TeacherMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,  
      children: teacherMenuItem,    
    );
  }
}

List<TeacherMenuItem> teacherMenuItem = [
  
  TeacherMenuItem(
    title : 'ข้อมูลส่วนตัว',
    icon : Icons.person,
    colorBox : Colors.blue,
    iconColor : Colors.white,
  ),
  TeacherMenuItem(
    title : 'ตารางสอน',
    icon : Icons.calendar_today,
    colorBox : Colors.red[300],
    iconColor : Colors.white,
  ),
  TeacherMenuItem(
    title : 'นัดหมาย',
    icon : Icons.calendar_view_day,
    colorBox : Colors.green[300],
    iconColor : Colors.white,
  ),
  TeacherMenuItem(
    title : 'จัดการข่าว ประกาศ',
    icon : Icons.description,
    colorBox : Colors.yellow[300],
    iconColor : Colors.white,
  ),
  TeacherMenuItem(
    title : 'จัดการกิจกรรม',
    icon : Icons.local_activity,
    colorBox : Colors.orange[300],
    iconColor : Colors.white,
  ),
   TeacherMenuItem(
    title : 'สถิติ รายงานกการเข้าร่วมกิจกรรม',
    icon : Icons.insert_chart,
    colorBox : Colors.pink[300],
    iconColor : Colors.white,
  ),
  
];

class TeacherMenuItem extends StatelessWidget {

  TeacherMenuItem({this.title, this.icon, this.colorBox,this.iconColor});
  
  final String title;
  final IconData icon;
  final Color colorBox,iconColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height:100.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: colorBox,
            shape: BoxShape.circle
          ),
          child: Icon(icon, color: iconColor),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(title,style: TextStyle(fontSize: 10.0,), textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}


