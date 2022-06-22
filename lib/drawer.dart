// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Draw extends StatefulWidget {
  const Draw({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DrawerState();
}

class DrawerState extends State<Draw> {
  Future<List> getread() async {
    var read = "https://jsonplaceholder.typicode.com/posts/1";
    var jread = await http.get(Uri.parse(read));

    if (jread.statusCode == 200) {
      List allreadbody = jread.body.split(':');
      return allreadbody;
    } else {
      throw Exception("error");
    }
  }

  late Future<List> user;
  @override
  void initState() {
    super.initState();
    user = getread();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text("drawer"),
          centerTitle: true,
          backgroundColor: const Color(0xFF10D48E).withOpacity(0.8),
        ),
        body: FutureBuilder<List>(
            future: user,
            builder: (context, snapchout) {
              if (snapchout.hasData) {
                return SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: 100,
                          child: Card(
                            elevation: 3,
                            color: Colors.white.withOpacity(0.7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: Text("API",
                                      style: TextStyle(
                                          color: Color(0xFF10D48E),
                                          fontSize: 20.8,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: 100,
                          child: Card(
                            elevation: 3,
                            color: Colors.white.withOpacity(0.7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: Text("API",
                                      style: TextStyle(
                                          color: Color(0xFF10D48E),
                                          fontSize: 20.8,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: 100,
                          child: Card(
                            elevation: 3,
                            color: Colors.white.withOpacity(0.7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: Text("API",
                                      style: TextStyle(
                                          color: Color(0xFF10D48E),
                                          fontSize: 20.8,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: 100,
                          child: Card(
                            elevation: 3,
                            color: Colors.white.withOpacity(0.7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: Text("${snapchout.data![0]}",
                                      style: TextStyle(
                                          color: Color(0xFF10D48E),
                                          fontSize: 20.8,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: 100,
                          child: Card(
                            elevation: 3,
                            color: Colors.white.withOpacity(0.7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: Text("Api",
                                      style: TextStyle(
                                          color: Color(0xFF10D48E),
                                          fontSize: 20.8,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: 100,
                          child: Card(
                            elevation: 3,
                            color: Colors.white.withOpacity(0.85),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const ListTile(
                                  title: Text("Api",
                                      style: TextStyle(
                                          color: Color(0xFF10D48E),
                                          fontSize: 20.8,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    width: double.infinity);
              } else if (snapchout.hasError) {
                return Text("${snapchout.error}");
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
