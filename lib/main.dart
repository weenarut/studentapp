import 'package:flutter/material.dart';
//import 'screen/home.dart';
import 'screen/homeStudent.dart';

void main() {
  runApp (
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'screen home',
      home: HomeStudent(),
    )
  );
}

