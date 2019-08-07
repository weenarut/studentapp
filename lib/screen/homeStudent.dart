import 'package:flutter/material.dart';

class HomeStudent extends StatefulWidget {
  @override
  _HomeStudentState createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudent> {
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
          Profile();
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
          height: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://cdn.vox-cdn.com/thumbor/hwf4WmK8AhQva_JNbBOEHNQjO60=/0x0:1280x720/920x613/filters:focal(538x258:742x462):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/60042087/chloe.0.jpg"
              )
            ),
          ),
        ),
        title: Text(
          'สุกัญญา หัสบดิน',
           style: TextStyle(fontWeight:FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            RaisedButton.icon(
              icon: Icon(Icons.album) ,
              label: Text(แต้มกิจกรรม),
              onPressed: () {},
              color: Colors.grey[200],
              elevation: 0.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            )
          ],
        ),
      ),
      
    );
  }
}