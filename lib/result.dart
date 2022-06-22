// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double? Temprature;
  final int? Humidity;
  const Result({Key? key, @required this.Temprature, @required this.Humidity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(children: [
          const Image(
            image: AssetImage(
              "image/incubator.png",
            ),
            height: 300,
            width: 300,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFF10D48E)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Temprature",
                        style: TextStyle(color: Colors.white, fontSize: 30.2)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("$Temprature C",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 30.2)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Humidity",
                        style: TextStyle(color: Colors.white, fontSize: 30.2)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("$Humidity %",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 30.2)),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 60,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Text("Control",
                          style: TextStyle(color: Colors.teal, fontSize: 30.2)),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 150,
                  height: 60,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Text("Read",
                          style: TextStyle(color: Colors.teal, fontSize: 30.2)),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, "read");
                      }),
                )
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
