import 'package:dio/dio.dart';

const BASE_URL = "https://laravel.smartexweb.kz/";

String apiProjects = "$BASE_URL" + "api/projects/";
String apiCategories = "$BASE_URL" + "api/categories/";

BaseOptions optionsDio = new BaseOptions(
  baseUrl: apiProjects,
  connectTimeout: 10000,
  receiveTimeout: 10000,
);