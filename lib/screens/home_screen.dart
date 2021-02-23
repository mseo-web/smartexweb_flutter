import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartexweb/stores/main_store.dart';
import 'package:smartexweb/components/app_drawer.dart';
import 'package:smartexweb/components/main_slider.dart';
import 'package:smartexweb/components/technologies_slider.dart';
import 'package:smartexweb/widgets/app_buttons.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.store, {Key key}) : super(key: key);
  final MainStore store;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF3B3B3B),
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
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            MainSlider(),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: PrimaryButton(
                'ПРОЕКТЫ',
                width: MediaQuery.of(context).size.width/3,
                action: () {
                  Navigator.of(context).pushNamed(
                    'projects',
                    // arguments: {'listProjects': listProjectsHome},
                  );
                }
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.desktop_mac,
                    color: const Color(0xFFFF4500),
                    size: 30.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'SMART',
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'УМНЫЙ подход к разработке приложений.',
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.desktop_mac,
                    color: const Color(0xFFFF4500),
                    size: 30.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'EXPERIENCE',
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ОПЫТ. Мы используем все самые современные подходы и технологии, накопленные разработчиками.',
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.desktop_mac,
                    color: const Color(0xFFFF4500),
                    size: 30.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'WEB',
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Современные WEB - технологии идеально подходят для всех, кто хочет создать захватывающий сайт!',
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]
              )
            ),
            TechnoSlider(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}