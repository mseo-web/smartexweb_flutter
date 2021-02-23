import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF3B3B3B),
        child: ListView(
          // padding: EdgeInsets.zero,
          children: <Widget>[
            new Container(
              width: MediaQuery.of(context).size.width,
              child: new DrawerHeader(
                decoration: new BoxDecoration(
                  color: const Color(0xFF404040),
                  border: new Border(
                      top: BorderSide(width: 1.0, color: Color(0xFF474747)),
                      bottom: BorderSide(width: 1.0, color: Color(0xFF474747)),
                  ),
                  // borderRadius: new BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color(0xFFFF4500).withOpacity(0.5),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                ),
                child: new Container(
                  padding: EdgeInsets.all(15),
                  child: Image.asset(
                    'assets/images/SM-logo2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              child: new FlatButton(
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushNamed('home');
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ГЛАВНАЯ'.toUpperCase(),
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              child: new FlatButton(
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushNamed('projects');
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ПРОЕКТЫ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              child: new FlatButton(
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushNamed('portfolio');
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ПОРТФОЛИО',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              child: new FlatButton(
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushNamed('contact');
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'КОНТАКТЫ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              child: new FlatButton(
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushNamed('about');
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'О НАС',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              child: new FlatButton(
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushNamed('settings');
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'НАСТРОЙКИ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ),
            ),
            Container(
              decoration: new BoxDecoration(
                color: const Color(0xFF404040),
                border: new Border(
                    top: BorderSide(width: 1.0, color: Color(0xFF474747)),
                    bottom: BorderSide(width: 1.0, color: Color(0xFF474747)),
                ),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.smartphone,
                      color: const Color(0xFFFF4500),
                    ),
                    title: Text(
                      '+77088210530',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}