import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'sign_up_page.dart';
import 'car_page.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Color(0xff090F32),
      home: Scaffold(
        body: CarPage(),
      )));
}


