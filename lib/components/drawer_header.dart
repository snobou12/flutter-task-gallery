import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({required this.selectMenuItem});

  final String selectMenuItem;

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              accountName: Text('Исаков Юрий',
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              accountEmail: Text("snoems12@gmail.com",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              currentAccountPicture: Container(
                child: Image(
                  image: AssetImage("assets/images/1.jpg"),
                  width: 50,
                  height: 50,
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              ),
            ),
          ),
          Container(
            color: widget.selectMenuItem == "Gallery"
                ? Colors.blue[100]
                : Colors.white,
            child: ListTile(
                title: Text("Галерея",
                    style: TextStyle(
                        color: widget.selectMenuItem == "Gallery"
                            ? Colors.blue[900]
                            : Colors.black,
                        fontSize: 15)),
                leading: Icon(
                  Icons.folder,
                  color: widget.selectMenuItem == "Gallery"
                      ? Colors.blue[900]
                      : Colors.grey,
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/gallery");
                }),
          ),
          Container(
            color: widget.selectMenuItem == "About"
                ? Colors.blue[100]
                : Colors.white,
            child: ListTile(
                title: Text("Обо мне",
                    style: TextStyle(
                        color: widget.selectMenuItem == "About"
                            ? Colors.blue[900]
                            : Colors.black,
                        fontSize: 15)),
                leading: Icon(
                  Icons.people,
                  color: widget.selectMenuItem == "About"
                      ? Colors.blue[900]
                      : Colors.grey,
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/about");
                }),
          )
        ],
      ),
    );
  }
}
