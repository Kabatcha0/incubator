// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sincubator/models/apibaby.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
//ignore_for_file: prefer_const_constructors

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => InformationState();
}

class InformationState extends State<Info> {
  Future<List<Apibaby>> getread() async {
    var read = "http://incubator.hopto.org:47543/api/baby/Add";
    var jread = await http.get(Uri.parse(read));
    if (jread.statusCode == 200) {
      List jreadbody = convert.jsonDecode(jread.body);
      List<Apibaby> allreadbody = [];
      for (var u in jreadbody) {
        Apibaby allread = Apibaby.fromjson(u);
        allreadbody.add(allread);
      }
      return allreadbody;
    } else {
      throw Exception("error");
    }
  }

  late Future<List<Apibaby>> cont;
  @override
  void initState() {
    super.initState();
    cont = getread();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Text("Info"),
          centerTitle: true,
          backgroundColor: Color(0xFF10D48E).withOpacity(0.8),
          actions: [
            IconButton(
                padding: EdgeInsets.only(top: 15, right: 10),
                color: Colors.white,
                alignment: Alignment.topRight,
                onPressed: () {
                  Navigator.pushNamed(context, "writebaby");
                },
                icon: Icon(Icons.pending)),
          ],
        ),
        body: FutureBuilder<List<Apibaby>>(
            future: cont,
            builder: (context, snapshout) {
              if (snapshout.hasData) {
                return ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  height: 100,
                                  child: Card(
                                    elevation: 3,
                                    color: Colors.white.withOpacity(0.85),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text("baby First name",
                                              style: TextStyle(
                                                  color: Color(0xFF10D48E),
                                                  fontSize: 20.8,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        Text(
                                          "${snapshout.data![0].babyfn}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF10D48E),
                                          ),
                                        )
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
                                      children: [
                                        ListTile(
                                          title: Text("last name",
                                              style: TextStyle(
                                                  color: Color(0xFF10D48E),
                                                  fontSize: 20.8,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        Text(
                                          "${snapshout.data![0].babyls}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF10D48E),
                                          ),
                                        )
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
                                      children: [
                                        ListTile(
                                          title: Text("1.Parents phone number",
                                              style: TextStyle(
                                                  color: Color(0xFF10D48E),
                                                  fontSize: 20.8,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        Text(
                                          "${snapshout.data![0].phoneNumber}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF10D48E),
                                          ),
                                        )
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
                                      children: [
                                        ListTile(
                                          title: Text("ID",
                                              style: TextStyle(
                                                  color: Color(0xFF10D48E),
                                                  fontSize: 20.8,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        Text(
                                          "${snapshout.data![0].idBaby}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF10D48E),
                                          ),
                                        )
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
                                      children: [
                                        ListTile(
                                          title: Text("Entry Date",
                                              style: TextStyle(
                                                  color: Color(0xFF10D48E),
                                                  fontSize: 20.8,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        Text(
                                          "${snapshout.data![0].entry}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF10D48E),
                                          ),
                                        )
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
                                      children: [
                                        ListTile(
                                          title: Text("medical history",
                                              style: TextStyle(
                                                  color: Color(0xFF10D48E),
                                                  fontSize: 20.8,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        Text(
                                          "${snapshout.data![0].medical}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF10D48E),
                                          ),
                                        )
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
                                      children: [
                                        ListTile(
                                          title: Text(
                                              "${snapshout.data![0].theReason}",
                                              style: TextStyle(
                                                  color: Color(0xFF10D48E),
                                                  fontSize: 20.8,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                        Text(
                                          "Api",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF10D48E),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            width: double.infinity),
                      );
                    });
              } else if (snapshout.hasError) {
                return Text("${snapshout.error}");
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
