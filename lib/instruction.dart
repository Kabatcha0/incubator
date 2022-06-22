import 'package:flutter/material.dart';

class Instruction extends StatefulWidget {
  const Instruction({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Instructionstate();
}

class Instructionstate extends State<Instruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("instruction"),
          centerTitle: true,
          backgroundColor: const Color(0xFF10D48E),
        ),
        body: ListView(
          children: [
            SizedBox(
                height: 270,
                width: 270,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Card(
                    child: Image.asset("image/incubator.png"),
                  )
                ])),
            Column(
              children: const [
                Card(
                  child: ListTile(
                    title: Text(
                      "1.don't publish your user and pass",
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF10D48E)),
                    ),
                  ),
                  elevation: 8,
                  shadowColor: Colors.green,
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "2. communicate with IT when there is any malfunction",
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF10D48E)),
                    ),
                  ),
                  elevation: 8,
                  shadowColor: Colors.green,
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "3.the incubator should be warmed up before placing the baby",
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF10D48E)),
                    ),
                  ),
                  elevation: 8,
                  shadowColor: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "4.periodic follow-up of the child's condition",
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF10D48E)),
                    ),
                  ),
                  elevation: 8,
                  shadowColor: Colors.green,
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "5.communication with the child' parents",
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF10D48E)),
                    ),
                  ),
                  elevation: 8,
                  shadowColor: Colors.green,
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "6. don't put slient mode",
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF10D48E)),
                    ),
                  ),
                  elevation: 8,
                  shadowColor: Colors.green,
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "7. humidity range",
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF10D48E)),
                    ),
                  ),
                  elevation: 8,
                  shadowColor: Colors.green,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "8. temprature=37-weight",
                      style: TextStyle(
                          fontSize: 17, color: const Color(0xFF10D48E)),
                    ),
                  ),
                  elevation: 8,
                  shadowColor: Colors.green,
                ),
              ],
            )
          ],
        ));
  }
}
