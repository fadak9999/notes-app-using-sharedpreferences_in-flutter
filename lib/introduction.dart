import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:notes_app_flutter/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class introduction extends StatefulWidget {
  const introduction({super.key});

  @override
  State<introduction> createState() => _introductionState();
}

class _introductionState extends State<introduction> {
  ////++++++++++++++++++++++++++++++

//1
  savepref2(String intt) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("int", intt);
  }

//2
  getpref2() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var loginn = preferences.getString("int");
    if (loginn != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => login(),
          ));
    }
  }

  //3
  @override
  void initState() {
    getpref2();
    super.initState();
  }

  ///++++++++++++++++++++++++++++++++++
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: Text(
              "You Welcome in : ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            body: "My Notes",
            image: Image.asset(
              "assets/ww2.png",
              height: 400,
              width: 400,
            ),
          ),
          //
          PageViewModel(
            titleWidget: Text(
              " 'My Notes' app allows you to : ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            body: "Record your tasks",
            image: Image.asset(
              "assets/int2.png",
              height: 400,
              width: 400,
            ),
          ),
          //
          PageViewModel(
            titleWidget: Text(
              "Thank You",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            body: "We hope you benefit from it",
            image: Image.asset(
              "assets/thank2.png",
              height: 400,
              width: 400,
            ),
          ),
          /////
        ],
        onDone: () async {
          //+++++++++++++++++++++++++++++

          await savepref2("int");

          //++++++++++++++++++++++++++++++++++++++++++++++++++
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => login(),
              ));
        },
        onSkip: () {},
        showBackButton: false,
        skip: Text(
          "Skip",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.amber),
        ),
//
        next: Icon(
          Icons.arrow_forward,
          color: Colors.amber,
        ),
        done: Text(
          "Done",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.amber),
        ),
        dotsDecorator: DotsDecorator(
            size: Size.square(10.0),
            activeSize: Size(20.0, 10.0),
            color: Colors.black26,
            activeColor: Colors.amber,
            spacing: EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            )),
      ),
    );
  }
}
