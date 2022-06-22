import 'package:flutter/material.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({Key? key}) : super(key: key);
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "read");
              },
              icon: const Icon(
                Icons.keyboard_backspace,
              )),
          title: const Text(
            "Instruction",
            style: TextStyle(fontSize: 25.5),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF10D48E)),
      body: Column(
        children: [
          Container(
            child: Image.asset("image/incubator.png"),
            height: 280,
            width: 280,
            padding: const EdgeInsets.only(top: 25),
          ),
          const AnimCard(
            Color.fromARGB(255, 14, 177, 120),
            '',
            '',
            '',
          ),
        ],
      ),
    );
  }
}

class AnimCard extends StatefulWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;

  // ignore: use_key_in_widget_constructors
  const AnimCard(this.color, this.num, this.numEng, this.content);

  @override
  _AnimCardState createState() => _AnimCardState();
}

class _AnimCardState extends State<AnimCard> {
  var padding = 150.0;
  var bottomPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPadding(
          padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          child: CardItem(
            widget.color,
            widget.num,
            widget.numEng,
            widget.content,
            () {
              setState(() {
                padding = padding == 0 ? 150.0 : 0.0;
                bottomPadding = bottomPadding == 0 ? 150 : 0.0;
              });
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.only(right: 20, left: 20, top: 200),
            height: 180,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 30)
              ],
              color: Colors.grey.shade200.withOpacity(1.0),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Center(
                child: Icon(Icons.baby_changing_station,
                    color: const Color(0xFF10D48E).withOpacity(1.0), size: 70)),
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;
  final onTap;

  // ignore: use_key_in_widget_constructors
  const CardItem(this.color, this.num, this.numEng, this.content, this.onTap);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 220,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 168, 236, 212).withOpacity(0.5),
                blurRadius: 25),
          ],
          color: color.withOpacity(1.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Tap to view more',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "1.don't publish your user and pass,2. communicate with IT when there is any malfunction,3.the incubator should be warmed up before placing the baby ,4.periodic follow-up of the child's condition , 5.communication with the child' parents , 7. H & T range ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
