import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:smartexweb/services/api/rest_settings.dart';
import 'package:smartexweb/services/api/rest_service.dart';

class ListStyle extends StatefulWidget {
  @override
  _ListStyleState createState() => _ListStyleState();
}

class _ListStyleState extends State<ListStyle> {
  List projects;
  List serverData;

  Future getProjects() async {
    List serverData = await RestService().getProjectsData();
    log('projects: $projects');
    setState(() {
      projects = serverData;
    });
  }

  @override
  void initState() {
    super.initState();
    getProjects();
  }

  String projectImages(imagesString) {
    log('imagesString: $imagesString');
    List itemImages = imagesString.split(" ");
    String firstImage = itemImages[0];
    log('firstImage: $firstImage');
    return firstImage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
      shrinkWrap: true,
      children: projects?.map<Widget>((item) => new Container(
          margin: EdgeInsets.all(15),
          height: 150,
          decoration: new BoxDecoration(
            // gradient: LinearGradient(
            //   colors: <Color>[
            //     Color(0xFF23283B),
            //     Color(0xFF404761),
            //   ],
            // ),
            border: new Border.all(
                color: Color(0xFF65EFEF), width: 1.0),
            // borderRadius: new BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF65EFEF).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Hero(
            tag: "image_" + item['id'].toString(),
            child: Material(
              color: Color(0xFF23283B),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   PageRouteBuilder(
                  //     opaque: false,
                  //     pageBuilder: (_, __, ___) => ProjectDetail(
                  //       objectProject: item,
                  //     ),
                  //   ),
                  // );
                  Navigator.pushNamed(
                    context,
                    'projectDetail',
                    arguments: item,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image(
                        image: NetworkImage(
                          "$BASE_URL" + projectImages(item['images']),
                          // "https://laravel.smartexweb.kz/public/assets/img/projects/smartexwebml4.png",
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Text(
                              item['title'],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF65EFEF),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              item['category_name'],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF65EFEF),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              item['period'],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF65EFEF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ))?.toList() ?? [],
      ),
    );
  }
}