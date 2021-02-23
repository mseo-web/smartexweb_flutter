import 'dart:core';
import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smartexweb/stores/main_store.dart';
import 'package:smartexweb/themes/theme.dart';
import 'package:smartexweb/components/app_drawer.dart';
import 'package:smartexweb/widgets/app_buttons.dart';
import 'package:smartexweb/components/projects_card.dart';

class PortfolioScreen extends StatelessWidget {
  PortfolioScreen(this.store, {Key key}) : super(key: key);
  final MainStore store;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // Widget _categoriesWidget(BuildContext context) {
  //   store.categories.initCategories();
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     width: AppTheme.fullWidth(context),
  //     height: 80,
  //     child: Observer(
  //       builder: (_) =>ListView(
  //         scrollDirection: Axis.horizontal,
  //         shrinkWrap: true,
  //         children: store.categories.categoriesAll.map((category) => CategoryButton(
  //           "${category['name']}",
  //           width: null,
  //           action: () {
  //             log('description: ${category["description"]}');
  //             store.projects.projectsGetByCategory('${category["description"]}');
  //           }
  //         ),).toList(),
  //       ),
  //     ),
  //   );
  // }

  // Widget _projectsWidget(BuildContext context) {
  //   store.projects.projectsGetByCategory('all');
  //   return Container(
  //     child: Center(
  //       child: Observer(
  //         builder: (_) =>GridView.extent(
  //           primary: false,
  //           padding: const EdgeInsets.all(8),
  //           crossAxisSpacing: 8,
  //           mainAxisSpacing: 8,
  //           // crossAxisCount: 2,
  //           maxCrossAxisExtent: 300,
  //           childAspectRatio: 1.0,
  //           shrinkWrap: true,
  //           children: store.projects.projectsByCategory?.map<Widget>((item) => new ProjectsCard(
  //             tag: "image_" + item['id'].toString(),
  //             imageUrl: item['photo'][0]['thumbnail'],
  //             name: item['name'],
  //             action: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 'portfolioDetail',
  //                 arguments: item,
  //               );
  //             },
  //           ),) ?.toList() ?? [],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    store.categories.initCategories();
    store.projects.projectsGetByCategory('all');
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: AppTheme.fullWidth(context),
                height: 80,
                child: Observer(
                  builder: (_) =>ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: store.categories.categoriesAll.map((category) => CategoryButton(
                      "${category['name']}",
                      width: null,
                      action: () {
                        log('description: ${category["description"]}');
                        store.projects.projectsGetByCategory('${category["description"]}');
                      }
                    ),).toList(),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Observer(
                    builder: (_) =>GridView.extent(
                      primary: false,
                      padding: const EdgeInsets.all(8),
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      // crossAxisCount: 2,
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 1.0,
                      shrinkWrap: true,
                      children: store.projects.projectsByCategory?.map<Widget>((item) => new ProjectsCard(
                        tag: "image_" + item['id'].toString(),
                        imageUrl: item['photo'][0]['thumbnail'],
                        name: item['name'],
                        action: () {
                          Navigator.pushNamed(
                            context,
                            'portfolioDetail',
                            arguments: item,
                          );
                        },
                      ),) ?.toList() ?? [],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}