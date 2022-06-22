import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

//ignore_for_file: prefer_const_constructors
class Writebaby extends StatefulWidget {
  const Writebaby({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => WritebabyState();
}

class WritebabyState extends State<Writebaby> {
  TextEditingController babyfirstname = TextEditingController();
  TextEditingController babylastname = TextEditingController();
  TextEditingController babyid = TextEditingController();
  TextEditingController doctorid = TextEditingController();
  TextEditingController nurseid = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController medical_of_history = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool istrue = true;
  insert() async {
    try {
      var ins = "http://incubator.hopto.org:47543/api/baby/Add";
      var res = await http.post(Uri.parse(ins),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: convert.jsonEncode(<String, dynamic>{
            "baby_id": babyid.text,
            "doctor_id": doctorid.text,
            "nurse_id": nurseid.text,
            "baby_firstname": babyfirstname.text,
            "baby_lastname": babylastname.text,
            "parents_phone_number": phone.text,
            "baby_reason_of_entry": reason.text,
            "baby_medical_history": medical_of_history.text,
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
          title: Text("Write the info"),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    child: SafeArea(
                        child: Column(children: [
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
                      style: TextStyle(color: Colors.white),
                      controller: babyfirstname,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " Baby first name requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "FirstName",
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
                      controller: babylastname,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " baby last name requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "LastName",
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
                const SizedBox(height: 20),
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                      controller: babyid,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return "BabyId requires";
                        }
                        return null;
                      },
                      obscureText: istrue,
                      decoration: InputDecoration(
                          labelText: "BabyId",
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
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " Parents Phone Number requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Parents Phone Number",
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
                const SizedBox(height: 20),
                Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: doctorid,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " Doctor Id requires";
                        }
                        return null;
                      },
                      obscureText: istrue,
                      decoration: InputDecoration(
                          labelText: "DoctorId",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.numbers_outlined,
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
                      style: TextStyle(color: Colors.white),
                      controller: nurseid,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " nurse id requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "NurseId",
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
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: reason,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " reason requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Reason",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.history_edu_outlined,
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
                      controller: medical_of_history,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " medical of history requires";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "MedicalOfHistory",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.history,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width: 0.3))),
                    )),
                const SizedBox(height: 5),
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
                              context, "information", (route) => false);
                          /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Info(
                                      baby: babyfirstname.text,
                                      id: int.parse(id.text),
                                      phone: int.parse(parentsPhoneNumber.text),
                                      phone2:
                                          int.parse(parentsPhoneNumber2.text),
                                      enter: int.parse(entrydate.text),
                                      exit: int.parse(exitdate.text)))); */
                        }
                      }),
                )
              ]))
        ]))))));
  }
}
