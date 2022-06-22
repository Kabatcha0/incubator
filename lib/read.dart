// ignore_for_file: unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:sincubator/models/apiread.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:animate_icons/animate_icons.dart';

//ignore_for_file: prefer_const_constructors

class Read extends StatefulWidget {
  const Read({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ReadState();
}

String api = " temperature  35 , humidity : 65%";
var datastrip = api.substring(12, 16);

class ReadState extends State<Read> {
  Future<List<Apiread>> getread() async {
    var read = "http://incubator.hopto.org:47543/api/readings/GetLastRecord";
    var jread = await http.get(Uri.parse(read));
    if (jread.statusCode == 200) {
      List jreadbody = convert.jsonDecode(jread.body);
      List<Apiread> allreadbody = [];
      for (var u in jreadbody) {
        Apiread allread = Apiread.fromjson(u);
        allreadbody.add(allread);
      }
      return allreadbody;
    } else {
      throw Exception("error");
    }
  }

  var refreshkey = GlobalKey<RefreshIndicatorState>();
  late Future<List<Apiread>> users;
  late AnimateIconController c1, c2, c3, c4, c5;
  @override
  void initState() {
    super.initState();
    users = getread();
    c1 = AnimateIconController();
    c2 = AnimateIconController();
    c3 = AnimateIconController();
    c4 = AnimateIconController();
    c5 = AnimateIconController();
  }

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF10D48E),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "choose");
            },
            icon: Icon(
              Icons.keyboard_backspace,
            )),
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
        centerTitle: true,
        title: Text("Read"),
      ),
      body: RefreshIndicator(
        key: refreshkey,
        edgeOffset: 0,
        backgroundColor: const Color(0xFF10D48E),
        color: Colors.white,
        onRefresh: () async {
          refreshkey.currentState?.show();
          await getread();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: FutureBuilder<List<Apiread>>(
              future: users,
              builder: (context, snapshout) {
                if (snapshout.hasData) {
                  return ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 190,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image(
                                                  fit: BoxFit.cover,
                                                  height: 220,
                                                  image: AssetImage(
                                                    "image/baby.jpg",
                                                  )),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          Container(
                                            height: 220,
                                            width: 190,
                                            child: Column(
                                                children: [
                                                  Container(
                                                      child: Column(children: [
                                                    Text(
                                                      "Temperatue",
                                                      style: TextStyle(
                                                          fontSize: 25.8,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "${snapshout.data![0].tem}",
                                                      style: TextStyle(
                                                          fontSize: 25.8,
                                                          color: Colors.white),
                                                    )
                                                  ]))
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black
                                                  .withOpacity(0.46),
                                            ),
                                          ),
                                          Container(
                                            width: 190,
                                            alignment: Alignment.topLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                AnimateIcons(
                                                  startIcon: Icons.hot_tub,
                                                  endIcon:
                                                      Icons.hot_tub_outlined,
                                                  controller: c1,
                                                  size: 30.0,
                                                  onStartIconPress: () {
                                                    print(
                                                        "Clicked on Add Icon");
                                                    return true;
                                                  },
                                                  onEndIconPress: () {
                                                    print(
                                                        "Clicked on Close Icon");
                                                    return true;
                                                  },
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  startIconColor: Colors.white,
                                                  endIconColor: Colors.white,
                                                  clockwise: false,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 190,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image(
                                                fit: BoxFit.cover,
                                                height: 220,
                                                image: AssetImage(
                                                  "image/baby.jpg",
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          Container(
                                            height: 220,
                                            width: 190,
                                            child: Column(
                                                children: [
                                                  Container(
                                                      child: Column(children: [
                                                    Text(
                                                      "Humidity",
                                                      style: TextStyle(
                                                          fontSize: 25.8,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "${snapshout.data![0].hum}",
                                                      style: TextStyle(
                                                          fontSize: 25.8,
                                                          color: Colors.white),
                                                    )
                                                  ]))
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black
                                                  .withOpacity(0.46),
                                            ),
                                          ),
                                          Container(
                                            width: 190,
                                            alignment: Alignment.topLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                AnimateIcons(
                                                  startIcon:
                                                      Icons.h_plus_mobiledata,
                                                  endIcon:
                                                      Icons.h_plus_mobiledata,
                                                  controller: c2,
                                                  size: 30.0,
                                                  onStartIconPress: () {
                                                    print(
                                                        "Clicked on Add Icon");
                                                    return true;
                                                  },
                                                  onEndIconPress: () {
                                                    print(
                                                        "Clicked on Close Icon");
                                                    return true;
                                                  },
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  startIconColor: Colors.white,
                                                  endIconColor: Colors.white,
                                                  clockwise: false,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 190,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image(
                                                fit: BoxFit.cover,
                                                height: 220,
                                                image: AssetImage(
                                                  "image/baby.jpg",
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          Container(
                                            height: 220,
                                            width: 190,
                                            child: Column(
                                                children: [
                                                  Container(
                                                      child: Column(children: [
                                                    Text(
                                                      "O2",
                                                      style: TextStyle(
                                                          fontSize: 25.8,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "${snapshout.data![0].ox}",
                                                      style: TextStyle(
                                                          fontSize: 25.8,
                                                          color: Colors.white),
                                                    )
                                                  ]))
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black
                                                  .withOpacity(0.46),
                                            ),
                                          ),
                                          Container(
                                            width: 190,
                                            alignment: Alignment.topLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                AnimateIcons(
                                                  startIcon: Icons.air,
                                                  endIcon: Icons.air,
                                                  controller: c3,
                                                  size: 30.0,
                                                  onStartIconPress: () {
                                                    print(
                                                        "Clicked on Add Icon");
                                                    return true;
                                                  },
                                                  onEndIconPress: () {
                                                    print(
                                                        "Clicked on Close Icon");
                                                    return true;
                                                  },
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  startIconColor: Colors.white,
                                                  endIconColor: Colors.white,
                                                  clockwise: false,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 190,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image(
                                                fit: BoxFit.cover,
                                                height: 220,
                                                image: AssetImage(
                                                  "image/baby.jpg",
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          Container(
                                            height: 220,
                                            width: 190,
                                            child: Column(
                                                children: [
                                                  Container(
                                                      child: Column(children: [
                                                    Text(
                                                      "CO2",
                                                      style: TextStyle(
                                                          fontSize: 25.8,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "${snapshout.data![0].co}",
                                                      style: TextStyle(
                                                          fontSize: 25.8,
                                                          color: Colors.white),
                                                    )
                                                  ]))
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black
                                                  .withOpacity(0.46),
                                            ),
                                          ),
                                          Container(
                                            width: 190,
                                            alignment: Alignment.topLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                AnimateIcons(
                                                  startIcon: Icons.air,
                                                  endIcon: Icons.air_sharp,
                                                  controller: c4,
                                                  size: 30.0,
                                                  onStartIconPress: () {
                                                    print(
                                                        "Clicked on Add Icon");
                                                    return true;
                                                  },
                                                  onEndIconPress: () {
                                                    print(
                                                        "Clicked on Close Icon");
                                                    return true;
                                                  },
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  startIconColor: Colors.white,
                                                  endIconColor: Colors.white,
                                                  clockwise: false,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 190,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image(
                                                  fit: BoxFit.cover,
                                                  height: 220,
                                                  image: AssetImage(
                                                    "image/baby.jpg",
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            Container(
                                              height: 220,
                                              width: 190,
                                              child: Column(
                                                  children: [
                                                    Container(
                                                        child:
                                                            Column(children: [
                                                      Text(
                                                        "Heartbeat",
                                                        style: TextStyle(
                                                            fontSize: 25.8,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        "${snapshout.data![0].hb}",
                                                        style: TextStyle(
                                                            fontSize: 25.8,
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ]))
                                                  ],
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.black
                                                    .withOpacity(0.46),
                                              ),
                                            ),
                                            Container(
                                              width: 190,
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  AnimateIcons(
                                                    startIcon:
                                                        Icons.health_and_safety,
                                                    endIcon:
                                                        Icons.health_and_safety,
                                                    controller: c5,
                                                    size: 30.0,
                                                    onStartIconPress: () {
                                                      print(
                                                          "Clicked on Add Icon");
                                                      return true;
                                                    },
                                                    onEndIconPress: () {
                                                      print(
                                                          "Clicked on Close Icon");
                                                      return true;
                                                    },
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    startIconColor:
                                                        Colors.white,
                                                    endIconColor: Colors.white,
                                                    clockwise: false,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshout.hasError) {
                  return Text("${snapshout.error}");
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          key: fabKey,
          // Cannot be `Alignment.center`
          alignment: Alignment.bottomRight,
          ringColor: Colors.white.withAlpha(70),
          ringDiameter: 420.0,
          ringWidth: 150.0,
          fabSize: 64.0,
          fabElevation: 8.0,
          fabIconBorder: CircleBorder(),

          fabColor: Colors.white,
          fabOpenIcon: Icon(Icons.menu, color: Color(0xFF10D48E)),
          fabCloseIcon: Icon(Icons.close, color: Color(0xFF10D48E)),
          fabMargin: const EdgeInsets.all(16.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,

          children: <Widget>[
            Tooltip(
              message: "log out",
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.logout, color: Colors.white),
              ),
            ),
            Tooltip(
              message: "drawer",
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, "drawer");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.my_library_books_sharp, color: Colors.white),
              ),
            ),
            Tooltip(
              message: "information",
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, "information");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.badge, color: Colors.white),
              ),
            ),
            Tooltip(
              message: "control",
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, "control");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child:
                    Icon(Icons.app_registration_rounded, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
