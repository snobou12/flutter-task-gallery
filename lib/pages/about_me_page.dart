import 'package:flutter/material.dart';
import 'package:flutter_gallery/components/drawer_header.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var route = ModalRoute.of(context);
    // if (route != null) {
    //   print(route.settings.name);
    // }
    return Scaffold(
      appBar: AppBar(
        title: Align(
          child: Text(
            "Обо мне",
            style: TextStyle(fontSize: 30),
          ),
          alignment: Alignment.centerLeft,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blue[300],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Image(
                  image: AssetImage("assets/images/1.jpg"),
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Align(
                  child: Text("Исаков Юрий",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  alignment: Alignment.center,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Align(
                  child: Text("snoems12@gmail.com",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700])),
                  alignment: Alignment.center,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black, spreadRadius: 1),
                      ],
                    ),
                    child: Text(
                        "JS | CSS | HTML | HTML5 | CSS3 | REACT | REDUX | GIT | MONGODB | TYPESCRIPT | SOCKET.IO ",
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerPage(selectMenuItem: "About"),
    );
  }
}
