import 'package:flutter/material.dart';
import 'package:notes_app_flutter/introduction.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  //

  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => introduction(),
          ));
    });
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Image.asset(
                "assets/notes.png",
                height: 150,
                width: 150,
              ),
            )),
            Text(
              "W e l c o m e",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
