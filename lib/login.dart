import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app_flutter/notes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  //1
  savepref(String log) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("login", log);
  }

//2
  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var loginn = preferences.getString("login");
    if (loginn != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => notes(),
          ));
    }
  }

  //3
  @override
  void initState() {
    getpref();
    super.initState();
  }

  //__________________________________
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 239, 98),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 700,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 239, 98),
                  boxShadow: [
                    (BoxShadow(
                      color: Color.fromARGB(255, 70, 71, 89).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(1),
                    bottomRight: Radius.circular(900),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Notes",
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 9, 18),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              ///1
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "name",

                    //
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 13, 12, 22), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 106, 143, 158), width: 2),
                    ),
                    //
                  ),
                ),
              ),

//
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Eimel",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 13, 12, 22), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 106, 143, 158), width: 2),
                    ),
                  ),
                ),
              ),
              /////
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "pasord",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 13, 12, 22), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 106, 143, 158), width: 2),
                    ),
                  ),
                ),
              ),
//////////////gogal,facbook
              Center(
                child: Container(
                  height: 60,
                  width: 160,
                  margin: EdgeInsets.only(top: 10, bottom: 5, left: 70),
                  child: Text(
                    "OR Sign in With",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

///////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "assets/google.webp",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 90),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "assets/face.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),

              /////////////////============
              Container(
                margin: EdgeInsets.all(20),
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    await savepref("login");
                    Navigator.pushNamed(context, 'notes');
                  },
                  child: Text("login"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 214, 210, 210),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
