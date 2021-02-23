import 'dart:core';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:smartexweb/services/api/rest_settings.dart';
import 'package:smartexweb/services/api/rest_service.dart';

class GridStyle extends StatefulWidget {
  @override
  _GridStyleState createState() => _GridStyleState();
}

class _GridStyleState extends State<GridStyle> {
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
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        children: projects?.map<Widget>((item) => new Container(
          child: Card(
            child: Hero(
              tag: "image_" + item['id'].toString(),
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'projectDetail',
                      arguments: item,
                    );
                  },
                  child: GridTile(
                    child: Image.network(
                      "$BASE_URL" + projectImages(item['images']),
                      // "https://laravel.smartexweb.kz/public/assets/img/projects/smartexwebml4.png",
                      fit: BoxFit.cover,
                    ),
                    footer: Container(
                      color: Colors.black12,
                      child: ListTile(
                        leading: Text(
                          item['category_name'],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF65EFEF),
                          ),
                        ),
                        // title: Text(
                        //   item['category_name'],
                        //   style: TextStyle(
                        //     fontSize: 8,
                        //     fontWeight: FontWeight.w700,
                        //     color: Color(0xFF65EFEF),
                        //   ),
                        // ),
                        // subtitle: Text(
                        //   item['period'],
                        //   style: TextStyle(
                        //     fontSize: 8,
                        //     fontWeight: FontWeight.w700,
                        //     color: Color(0xFF65EFEF),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // color: Colors.teal[100],
        ),) ?.toList() ?? [],
      ),
    );
  }
}