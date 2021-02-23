import 'dart:core';
import 'dart:developer';
// import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smartexweb/stores/main_store.dart';
// import 'package:smartexweb/models/category.dart';
// import 'package:smartexweb/services/api/rest_settings.dart';
import 'package:smartexweb/services/api/rest_service.dart';
import 'package:smartexweb/components/app_drawer.dart';
// import 'package:smartexweb/widgets/app_buttons.dart';
import 'package:smartexweb/components/projects_card.dart';

class ProjectsScreen extends StatefulWidget {
  ProjectsScreen(this.store, {Key key}) : super(key: key);
  final MainStore store;
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List projects;
  List serverProjectsData;
  List filteredProjects;
  List categories;
  List serverCategoriesData;
  String _selectedCategory = 'all';

  // static List categoryList = [
  //   Category(id: 99,name: "Все",description: "all"),
  //   Category(id: 1,name: "LARAVEL",description: "laravel"),
  //   Category(id: 2,name: "APACHE CORDOVA",description: "apache-cordova"),
  //   Category(id: 3,name: "ELECTRON",description: "electron"),
  //   Category(id: 4,name: "KOHANA(PHP)",description: "kohanaphp"),
  // ];

  List categoryList = [
    {"id": 99, "name": "ВСЕ", "description": "all"},
  ];

  Future getCategories() async {
    serverCategoriesData = await RestService().getCategoriesData();
    log('serverCategoriesData.length: ${serverCategoriesData.length}');
    for (var i = 0; i < serverCategoriesData.length; i++) {
      var categoryItem = {"id": serverCategoriesData[i]['id'], "name": serverCategoriesData[i]['name'], "description": serverCategoriesData[i]['description']};
      categoryList.add(categoryItem);
    }
    setState(() {
      categories = categoryList;
    });
    log('categories: $categories');
  }

  Future getProjects() async {
    serverProjectsData = await RestService().getProjectsData();
    setState(() {
      projects = serverProjectsData;
      filteredProjects = projects;
    });
  }

  void projectsByCategory(category) {
    var projectsByCategory = [];
    if (category == 'all') {
      projectsByCategory = projects;
    } else {
      for (var i = 0; i < projects.length; i++){
        for (var n = 0; n < projects[i]['categories'].length; n++){
          if (projects[i]['categories'][n]['description'] == category) {
            projectsByCategory.add(projects[i]);
          }
        }
      }
    }
    setState(() {
      filteredProjects = projectsByCategory;
    });
  }
  
  @override
  void initState() {
    super.initState();
    getCategories();
    getProjects();
  }

  Widget _categoriesWidget() {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: categoryList.map((category) => Container(
          margin: EdgeInsets.all(5.0),
          child: ChoiceChip(
            selected: _selectedCategory == '${category['description']}',
            // backgroundColor: Color(0xFFE10E56),
            backgroundColor: Color(0xFFFF4500),
            selectedColor: Color(0xFFE10E56),
            avatar: Icon(
              Icons.apps,
              color: Color(0xFFFFFFFF),
              size: 20.0,
              semanticLabel: 'category',
            ),
            label: Text(
                '${category['name']}',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold
                  ),
              ),
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  _selectedCategory = '${category['description']}';
                }
              });
              print("${category["description"]}");
              projectsByCategory("${category["description"]}");
            }
          ),
        ),).toList(),
      ),
    );
  }

  Widget _projectsWidget() {
    return Container(
      child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        // crossAxisCount: 2,
        maxCrossAxisExtent: 300,
        childAspectRatio: 1.0,
        shrinkWrap: true,
        children: filteredProjects?.map<Widget>((item) => new ProjectsCard(
          tag: "image_" + item['id'].toString(),
          imageUrl: item['photo'][0]['thumbnail'],
          name: item['name'],
          action: () {
            Navigator.pushNamed(
              context,
              'projectDetail',
              arguments: item,
            );
          },
        ),) ?.toList() ?? [],
      ),
    );
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
          },
        ),
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
      body: Container(
        // height: MediaQuery.of(context).size.height - 210,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _categoriesWidget(),
              _projectsWidget()
            ],
          ),
        ),
      ),
    );
  }
}