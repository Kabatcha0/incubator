import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
//ignore_for_file: prefer_const_constructors

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => RegisterState();
}

//ctrl+shift+L
//--no-tree-shake-icons
class RegisterState extends State<Register> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController id = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool istrue = true;
  insert() async {
    try {
      var ins = "http://incubator.hopto.org:47543/api/doctor/Add";
      var res = await http.post(Uri.parse(ins),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: convert.jsonEncode(<String, dynamic>{
            "doctor_id": id.text,
            "doctor_firstname": firstname.text,
            "doctor_lastname": lastname.text,
            "doctor_username": username.text,
            "doctor_password": password.text,
            "doctor_email": email.text,
            "doctor_mobile": mobile.text,
          }));
      print(res.body);
      return res;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF10D48E),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "login");
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
          title: Text("Register"),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    child: SafeArea(
                        child: Column(children: [
          Container(
            child: Image.asset("image/incubator.png"),
            height: 250,
            width: 250,
            padding: const EdgeInsets.only(top: 20.5, bottom: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Form(
              key: formstate,
              child: Column(children: [
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: Colors.white),
                      controller: firstname,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " first name requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "FirtsName",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 0.3))),
                    )),
                const SizedBox(height: 20),
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      //keyboardType: TextInputType.visiblePassword,
                      keyboardType: TextInputType.name,
                      controller: lastname,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return "last name requires";
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                          labelText: "LastName",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 0.3))),
                    )),
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: Colors.white),
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " username requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.supervised_user_circle_outlined,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 0.3))),
                    )),
                const SizedBox(height: 20),
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " password requires";
                        }
                        return null;
                      },
                      obscureText: istrue,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.password,
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 0.3))),
                    )),
                const SizedBox(height: 20),
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white),
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " email requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 0.3))),
                    )),
                const SizedBox(height: 20),
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      controller: mobile,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " mobile requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Mobile",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 0.3))),
                    )),
                const SizedBox(height: 15),
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      controller: id,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " id requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "ID",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.numbers_outlined,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 0.3))),
                    )),
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
                      child: Text("Save",
                          style: TextStyle(fontSize: 25.5, color: Colors.teal)),
                      onPressed: () {
                        if (formstate.currentState!.validate()) {
                          insert();
                          Navigator.pushNamedAndRemoveUntil(
                              context, "choose", (route) => false);
                        }
                      }),
                )
              ]))
        ]))))));
  }
}
