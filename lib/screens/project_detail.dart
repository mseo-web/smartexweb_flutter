// import 'dart:core';
import 'package:flutter/material.dart';
// import 'dart:developer';
import 'package:smartexweb/stores/main_store.dart';
import 'package:smartexweb/components/app_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

class ProjectDetail extends StatefulWidget {
  ProjectDetail(this.store, {Key key}) : super(key: key);
  final MainStore store;
  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // List projectImages(imagesString) {
  //   log('imagesString: $imagesString');
  //   List itemImages = imagesString.split(" ");
  //   log('itemImages: $itemImages');
  //   return itemImages;
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map objectProject = ModalRoute.of(context).settings.arguments;
    // log('objectProject: $objectProject');
    // int _current = 0;
    List imagesArray = objectProject['photo'];
    List categoriesNamesList = [];
    String categoriesNamesToString = "";
    List projectCategories = objectProject['categories'];
    for (var i = 0; i < projectCategories.length; i++) {
      categoriesNamesList.add(projectCategories[i]['name']);
    }
    categoriesNamesToString = categoriesNamesList.join(", ");
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
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Hero(
                        tag: "image_" + objectProject['id'].toString(),
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Image.network(imagesArray[0]['thumbnail'],),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 36, right: 36, bottom: 10),
                      child: Text(
                        objectProject['name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFF4500),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 36, right: 36, bottom: 10),
                      child: Text(
                        "Категория: " + categoriesNamesToString,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF3B3B3B),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 36, right: 36, bottom: 10),
                      child: Text(
                        "Заказчик: " + objectProject['client'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF3B3B3B),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 36, right: 36, bottom: 20),
                      child: Text(
                        "Период: " + objectProject['period'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF3B3B3B),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 36, right: 36, bottom: 20),
                      child: Text(
                        "Сайт проекта: " + objectProject['siteurl'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF3B3B3B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  CarouselSlider(
                    items: imagesArray.map<Widget>((i) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15),
                        clipBehavior: Clip.antiAlias,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          i['thumbnail'], 
                          fit: BoxFit.cover),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: (MediaQuery.of (context) .size.width)/3,
                      aspectRatio: 1.66,
                      viewportFraction: 0.7,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      // autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        // setState(() {
                        //   _current = index;
                        // });
                      },
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: imagesArray.map((url) {
                  //     int index = imagesArray.indexOf(url);
                  //     return Container(
                  //       width: 8.0,
                  //       height: 8.0,
                  //       margin: EdgeInsets.symmetric(
                  //           vertical: 10.0, horizontal: 2.0),
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: _current == index
                  //             ? Color.fromRGBO(0, 0, 0, 0.9)
                  //             : Color.fromRGBO(0, 0, 0, 0.4),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}