import 'dart:core';
import 'package:flutter/material.dart';
import 'package:smartexweb/stores/main_store.dart';
import 'package:smartexweb/components/app_drawer.dart';
import 'package:smartexweb/components/technologies_slider.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen(this.store, {Key key}) : super(key: key);
  final MainStore store;
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
                  Image(
                    image: AssetImage('assets/images/apple-devices-apple-keyboard-blur-coffee-322338.jpg'),
                    // alignment: Alignment.bottomCenter,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Несколько слов о нас',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'МЫ ЗНАЕМ, ЧТО НАШИ КЛИЕНТЫ ЯВЛЯЮТСЯ КЛЮЧОМ К НАШЕМУ РОСТУ.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: const Color(0xFFFF4500),
                          size: 30.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width*0.8,
                          child: 
                            Text(
                              'Создание сайтов на CMS "WordPress" и других технологиях.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: const Color(0xFFFF4500),
                          size: 30.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width*0.8,
                          child: 
                            Text(
                              'Создание мобильных приложений на разных платформах.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: const Color(0xFFFF4500),
                          size: 30.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width*0.8,
                          child: 
                            Text(
                              'Создание десктопных приложений на платформе "Electron".',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Поскольку мы потратили много времени на работу с различными клиентами, мы реализовали много интересных функций для наших приложений, которые предлагали наши клиенты.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ),
            TechnoSlider(),
          ],
        ),
      ),
    );
  }
}