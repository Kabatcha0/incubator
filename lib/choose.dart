// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
//ignore_for_file: prefer_const_constructors

class Choose extends StatefulWidget {
  const Choose({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ChooseState();
}

class ChooseState extends State<Choose> {
  String? selected;
  void drop(String? val) {
    setState(() {
      selected = val;
    });
  }

  GlobalKey<FormState> formst = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Container(
      width: double.infinity,
      child: Column(children: [
        Container(
          child: Image.asset("image/incubator.png"),
          height: 350,
          width: 350,
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text(
              "Choose the Incubator",
              style: TextStyle(color: Colors.white, fontSize: 25),
            )
          ]),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: 200,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        Icon(Icons.baby_changing_station,
                            size: 20, color: Colors.white),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Incubator A',
                            style: TextStyle(
                              fontSize: 20.8,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: <String>["Incubator B ", "Incubator C "]
                        .map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem<String>(
                        child: Row(children: [
                          Icon(Icons.baby_changing_station,
                              size: 20, color: Colors.white),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "$e",
                            style: TextStyle(
                              fontSize: 20.8,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                        value: e,
                      );
                    }).toList(),
                    onChanged: drop,
                    //value: selected,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 20,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white.withOpacity(0.6),
                    buttonHeight: 50,
                    buttonWidth: 160,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.white),
                      color: Color(0xFF10D48E),
                    ),
                    buttonElevation: 2,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: 200,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.tealAccent,
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(0, 0),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                width: 145,
                height: 60,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    elevation: 0.2,
                    minWidth: 100,
                    color: Colors.white,
                    textColor: Color(0xFF10D48E),
                    child: Text("Next",
                        style: TextStyle(fontSize: 27.5, color: Colors.teal)),
                    onPressed: () {
                      Navigator.pushNamed(context, "read");
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 145,
                height: 60,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    elevation: 0.2,
                    minWidth: 100,
                    color: Colors.white,
                    textColor: Color(0xFF10D48E),
                    child: Text("Log out",
                        style: TextStyle(fontSize: 22.5, color: Colors.teal)),
                    onPressed: () {
                      Navigator.pushNamed(context, "login");
                    }),
              )
            ],
          ),
        ),
      ]),
    ))));
  }
}
