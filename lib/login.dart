// ignore_for_file: avoid_print, avoid_unnecessary_containers, empty_statements

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
//ignore_for_file: prefer_const_constructors

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController pass = TextEditingController();
  TextEditingController user = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool istrue = true;
  var name = "Mohamed";
  var password = "ahmed";
  signin() async {
    if (formstate.currentState!.validate()) {
      var data = {"userId": user.text, "id": pass.text};
      var url = "https://jsonplaceholder.typicode.com/posts/1";
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        var responsebody = convert.jsonDecode(response.body);
        print(responsebody["username"]);
        Navigator.pushNamedAndRemoveUntil(context, "choose", (route) => false);
        return responsebody;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "instruction");
                  },
                  child: Icon(Icons.info, color: Colors.white, size: 30),
                ),
              ),
              Center(
                  child: Container(
                child: Image.asset("image/incubator.png"),
                height: 320,
                width: 320,
                padding: const EdgeInsets.only(top: 20.5, bottom: 25),
              )),
              SizedBox(
                height: 10,
              ),
              Form(
                  key: formstate,
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            style: TextStyle(color: Colors.white),
                            onFieldSubmitted: (username) {
                              print(username);
                            },
                            controller: user,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " name requires";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "username",
                                labelStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.supervised_user_circle_outlined,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    borderSide: BorderSide(width: 0.3))),
                          )),
                      const SizedBox(height: 20),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.visiblePassword,
                            onFieldSubmitted: (password) {
                              print(password);
                            },
                            controller: pass,
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return " password requires";
                              }
                              return null;
                            },
                            obscureText: istrue,
                            decoration: InputDecoration(
                                labelText: "password",
                                labelStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(istrue
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      istrue = !istrue;
                                    });
                                  },
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    borderSide: BorderSide(width: 0.3))),
                          )),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(left: 8),
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(7),
                              child: Text("You take responsability",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.5,
                                      fontWeight: FontWeight.normal))),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 200,
                        height: 75,
                        padding: const EdgeInsets.all(10),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            elevation: 0.2,
                            minWidth: 100,
                            color: Colors.white,
                            textColor: Color(0xFF10D48E),
                            child: Text("login",
                                style: TextStyle(
                                    fontSize: 25.5, color: Colors.teal)),
                            onPressed: () {
                              if (formstate.currentState!.validate()) {
                                //signin();
                                if (user.text == name) {
                                  if (pass.text == password) {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, "choose", (route) => false);
                                  } else {
                                    final snackBar = SnackBar(
                                      content: Text(
                                          "Login error or you don't have an Incubator to monitor"),
                                      duration: Duration(milliseconds: 3000),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "Login error or you don't have an Incubator to monitor"),
                                    duration: Duration(milliseconds: 3000),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            }),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 200,
                        height: 75,
                        padding: const EdgeInsets.all(10),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            elevation: 0.2,
                            minWidth: 100,
                            color: Colors.white,
                            textColor: Color(0xFF10D48E),
                            child: Text("Register",
                                style: TextStyle(
                                    fontSize: 23.5, color: Colors.teal)),
                            onPressed: () {
                              Navigator.pushNamed(context, "register");
                              //SystemNavigator.pop();
                            }),
                      ),
                    ],
                  ))
            ],
          ),
        )),
      ),
    ));
  }
}
