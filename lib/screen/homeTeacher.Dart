import 'package:flutter/material.dart';
import 'package:studentapp/screen/Dashboard.dart';
import 'package:studentapp/screen/activity.dart';
import 'package:studentapp/screen/appointment.dart';
import 'package:studentapp/screen/regulation.dart';
import 'package:studentapp/screen/announce.dart';

class HomeTeacher extends StatefulWidget {
  final String username;
  HomeTeacher(this.username);

  @override
  _HomeTeacherState createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
        children: <Widget>[
          Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://png.pngtree.com/png-clipart/20190603/original/pngtree-business-cartoon-character-elements-png-image_655201.jpg")),
          ),
        ),
        title: Text(
          '${widget.username}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
          Divider(),
          TeacherMenu(),
        ],
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
      crossAxisSpacing: 10.0,
      padding: EdgeInsets.fromLTRB(60, 20, 20, 20),
      children: <Widget>[
        MyMenu(
          title: 'profile',
          icon: Icons.person,
          iconColor: Colors.orange,
        ),
        MyMenu(
          title: 'ตารางสอน',
          icon: Icons.calendar_today,
          iconColor: Colors.blue,
        ),
        MyMenu(
          title: 'นัดหมาย',
          icon: Icons.perm_contact_calendar,
          iconColor: Colors.green,
        ),
        MyMenu(
          title: 'ประกาศ',
          icon: Icons.announcement,
          iconColor: Colors.red,
        ),
        MyMenu(
          title: 'กิจกรรม',
          icon: Icons.local_activity,
          iconColor: Colors.green,
        ),
        MyMenu(
          title: 'สถิติ',
          icon: Icons.insert_chart,
          iconColor: Colors.red,
        ),
      ],
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.icon, this.iconColor});

  final String title;
  final IconData icon;
  final MaterialColor iconColor;


  void _openPage(context,pagename){
    switch (pagename) {
      case "ข้อมูลส่วนตัว":
        {
          Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new Regulation(),
          ),);
        }
        break;
      case "ตารางสอน":
        {
          Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new Regulation(),
          ),);
        }
        break;
      case "นัดหมาย":
        {
          Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new Appointment(),
          ),);
        }
        break;

      case "ประกาศ":
        {
          Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new Announce(),
          ),);
        }
        break;

        case "กิจกรรม":
        {
          Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new Activity(),
          ),);
        }
        break;
        case "สถิติ":
        {
          Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new Dashboard(),
          ),);
        }
        break;
        default:
        {
          //statements;
        }
        break;
      }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildListDelegate([
              Card(
                margin: EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () { 
                    _openPage(context,title);
                  },
                  splashColor: Colors.green,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(icon, size: 40.0, color: iconColor),
                        Text(title, style: TextStyle(fontSize: 10.0))
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
