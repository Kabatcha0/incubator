// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
//ignore_for_file: prefer_const_constructors

class Anime extends StatefulWidget {
  const Anime({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Animeonstate();
}

class Animeonstate extends State<Anime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color(0xFF10D48E),
          title: Text(
            "S-Incubator app",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Center(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 45),
                      height: 600,
                      child: Lottie.asset("image/doctorwithmobile.json"),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "login");
          },
          tooltip: 'Next',
          child: Icon(
            Icons.arrow_forward_sharp,
            color: Color(0xFF10D48E),
            size: 35,
          ),
          backgroundColor: Colors.white),
    );
  }
}
