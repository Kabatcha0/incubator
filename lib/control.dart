// ignore_for_file: avoid_unnecessary_containers

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:sincubator/result.dart';
//ignore_for_file: prefer_const_constructors

class Control extends StatefulWidget {
  const Control({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ControlState();
}

class ControlState extends State<Control> {
  double _counter = 37.0;
  int humidity = 65;
  control() async {
    try {
      var ins = "http://incubator.hopto.org:47543/api/baby/Add";
      var res = await http.post(Uri.parse(ins),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: convert.jsonEncode(<String, dynamic>{
            "baby_id": _counter.toString(),
            "doctor_id": humidity.toString(),
          }));
      return res;
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
  }

  void _incrementCount() {
    if (_counter < 37) {
      setState(() {
        _counter = _counter + 0.5;
      });
    }
  }

  void _decrementCount() {
    if (_counter > 33) {
      setState(() => _counter = _counter - 0.5);
    }
  }

  void _incrementhumidity() {
    if (humidity < 70) {
      setState(() {
        humidity++;
      });
    }
  }

  void _decrementhumidity() {
    if (humidity > 65) {
      setState(() => humidity--);
    }
  }

  void _reset() {
    setState(() {
      _counter = 37;
      humidity = 65;
    });
  }

  /*storepost() async {
    var url = "https://jsonplaceholder.typicode.com/posts/1";
    var reponse = await http.post(Uri.parse(url), body: {
      "userId": "$_counter ",
      "id": "$humidity",
      "title": "suncati excepturi optio reprehenderit",
      "body": "qu"
    });
    print(reponse.body);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Control"),
        centerTitle: true,
        backgroundColor: Color(0xFF10D48E),
        actions: [
          IconButton(
              padding: EdgeInsets.only(top: 15, right: 10),
              color: Colors.white,
              alignment: Alignment.topRight,
              onPressed: () {
                Navigator.pushNamed(context, "instruction");
              },
              icon: Icon(Icons.info)),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(15.8),
              child: Image.asset("image/incubator.png"),
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: FloatingActionButton(
                        backgroundColor: const Color(0xFF10D48E),
                        child: Icon(Icons.arrow_circle_up_sharp, size: 45.5),
                        onPressed: _incrementCount,
                        heroTag: "Temperature++",
                      )),
                ),
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Temperature",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 25.5,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '$_counter',
                          style: TextStyle(fontSize: 25.5, color: Colors.white),
                        ),
                      ]),
                ),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: FloatingActionButton(
                        backgroundColor: const Color(0xFF10D48E),
                        child: Icon(Icons.arrow_circle_down_sharp, size: 45.5),
                        onPressed: _decrementCount,
                        heroTag: "Temperature--",
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: FloatingActionButton(
                        backgroundColor: const Color(0xFF10D48E),
                        child: Icon(Icons.arrow_circle_up_sharp, size: 45.5),
                        onPressed: _incrementhumidity,
                        heroTag: "humidity++",
                      )),
                ),
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Humidity",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 25.5,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '$humidity %',
                          style: TextStyle(fontSize: 25.5, color: Colors.white),
                        ),
                      ]),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: FloatingActionButton(
                        backgroundColor: const Color(0xFF10D48E),
                        child: Icon(Icons.arrow_circle_down_sharp, size: 45.5),
                        onPressed: _decrementhumidity,
                        heroTag: "humidity--"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                width: 220,
                height: 50,
                margin: const EdgeInsets.all(25),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    elevation: 0.2,
                    minWidth: 100,
                    color: Colors.white,
                    textColor: Color(0xFF10D48E),
                    child: Text("submit",
                        style: TextStyle(fontSize: 20.5, color: Colors.teal)),
                    onPressed: () {
                      //storepost();
                      control();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Result(
                                  Temprature: _counter, Humidity: humidity)));
                    }))
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reset,
        tooltip: 'reset',
        child: Icon(
          Icons.refresh,
          color: Color(0xFF10D48E),
          size: 35,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
