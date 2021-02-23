import 'dart:core';
import 'package:flutter/material.dart';
import 'package:smartexweb/stores/main_store.dart';
import 'package:smartexweb/components/app_drawer.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen(this.store, {Key key}) : super(key: key);
  final MainStore store;
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white.withOpacity(0.85),
      key: _scaffoldKey,
      drawer: new AppDrawer(),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.reorder,
              color: Color(0xFFFF4500),
              size: 30.0,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            }),
        title: new Container(
          width: 120,
          child:Image(image: AssetImage('assets/images/SM-logo2.png')),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color(0xFFFF4500),
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('settings');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Color(0x20000000),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.location_on,
                    color: const Color(0xFFFF4500),
                    size: 30.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Наш адрес',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Республика Казахстан, г. Павлодар',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Color(0x20000000),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.mail_outline,
                    color: const Color(0xFFFF4500),
                    size: 30.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Наш Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'smih82177@gmail.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(15.0),
                color: Colors.white,
                // image: new DecorationImage(
                //   image: new NetworkImage(imageUrl),
                //   // alignment: Alignment.bottomCenter,
                //   fit: BoxFit.fitWidth,
                // ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Color(0x20000000),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.smartphone,
                    color: const Color(0xFFFF4500),
                    size: 30.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Наш телефон',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '+77088210530',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}