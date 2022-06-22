// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sincubator/choose.dart';
import 'package:sincubator/control.dart';
import 'package:sincubator/information.dart';
import 'package:sincubator/instruction.dart';
import 'package:sincubator/login.dart';
import 'package:sincubator/read.dart';
import 'package:sincubator/anime.dart';
import 'package:sincubator/drawer.dart';
import 'package:sincubator/card.dart';
import 'package:sincubator/register.dart';
import 'package:sincubator/writebaby.dart';
//ignore_for_file: prefer_const_constructors

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF10D48E)),
      title: "incubator",
      home: Anime(),
      routes: {
        "login": (context) => Login(),
        "choose": (context) => Choose(),
        "read": (context) => Read(),
        "instruction": (context) => MyCustomWidget(),
        "information": (context) => Info(),
        "control": (context) => Control(),
        "anime": (context) => Anime(),
        "drawer": (context) => Draw(),
        "register": (context) => Register(),
        "writebaby": (context) => Writebaby()
      },
    );
  }
}
