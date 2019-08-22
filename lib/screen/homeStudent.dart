import 'package:flutter/material.dart';

class HomeStudent extends StatefulWidget {
  final String username;
  HomeStudent(this.username);

  @override
  _HomeStudentState createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://cdn.vox-cdn.com/thumbor/hwf4WmK8AhQva_JNbBOEHNQjO60=/0x0:1280x720/920x613/filters:focal(538x258:742x462):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/60042087/chloe.0.jpg")),
                ),
              ),
              title: Text(
                '${widget.username}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  RaisedButton.icon(
                    icon: Icon(Icons.album),
                    label: Text('แต้มกิจกรรม'),
                    onPressed: () {},
                    color: Colors.grey[200],
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          StudentMenu(),
        ],
      ),
    );
  }
}

class StudentMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      children: studentMenuItem,
    );
  }
}

List<StudentMenuItem> studentMenuItem = [
  StudentMenuItem(
    title: 'ข้อมูลส่วนตัว',
    icon: Icons.person,
    colorBox: Colors.blue,
    iconColor: Colors.white,
  ),
  StudentMenuItem(
    title: 'ตารางเรียน',
    icon: Icons.calendar_today,
    colorBox: Colors.blue[300],
    iconColor: Colors.white,
  ),
  StudentMenuItem(
    title: 'นัดหมาย',
    icon: Icons.calendar_today,
    colorBox: Colors.green[300],
    iconColor: Colors.white,
  ),
  StudentMenuItem(
    title: 'กิจกรรมของฉัน',
    icon: Icons.local_activity,
    colorBox: Colors.orange[300],
    iconColor: Colors.white,
  ),
];

class StudentMenuItem extends StatelessWidget {
  StudentMenuItem({this.title, this.icon, this.colorBox, this.iconColor});

  final String title;
  final IconData icon;
  final Color colorBox, iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 70.0,
              width: 70.0,
              decoration:
                  BoxDecoration(color: colorBox, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 10.0,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
