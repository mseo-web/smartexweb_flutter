import 'dart:core';
// import 'dart:developer';
import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert' as convert;
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smartexweb/services/api/rest_settings.dart';

class RestService {

  List listCategories;
  List listProjects;
  // Map serverData;

  RestService({
    this.listCategories,
    this.listProjects, 
    // this.serverData,
  });

  // Future getData() async {
  //   Response response;
  //   Dio dio = new Dio();
  //   response = await dio.get(optionsDio.baseUrl);
  //   // serverData = response.data;
  //   // log('serverData: $serverData.type');
  //   this.listProjects = response.data["data"];
  //   log('listProjects: $listProjects');
  //   return listProjects;
  // }

  Future getCategoriesData() async {
    http.Response response = await http.get(apiCategories);
    var serverCategories = convert.jsonDecode(response.body);
    // log('serverData: $serverCategories');
    listCategories = serverCategories["data"];
    // log('listCategories: $listCategories');
    return listCategories;
  }

  Future getProjectsData() async {
    http.Response response = await http.get(apiProjects);
    var serverProjects = convert.jsonDecode(response.body);
    // log('serverData: $serverProjects');
    listProjects = serverProjects["data"];
    // log('listProjects: $listProjects');
    return listProjects;
  }
}