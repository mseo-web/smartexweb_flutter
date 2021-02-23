import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:smartexweb/services/preferences_service.dart';
import 'package:smartexweb/stores/main_store.dart';

import 'package:smartexweb/screens/settings_widgets.dart';
import 'package:smartexweb/screens/home_screen.dart';
import 'package:smartexweb/screens/projects_screen.dart';
import 'package:smartexweb/screens/project_detail.dart';
import 'package:smartexweb/screens/about_screen.dart';
import 'package:smartexweb/screens/contact_screen.dart';
import 'package:smartexweb/screens/portfolio_screen.dart';
import 'package:smartexweb/screens/portfolio_detail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences));
}

class MyApp extends StatelessWidget {
  const MyApp(this.sharedPreferences);

  final SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [
        Provider<PreferencesService>(
          create: (_) => PreferencesService(sharedPreferences),
        ),
        ProxyProvider<PreferencesService, MainStore>(
            update: (_, preferencesService, __) =>
                MainStore(preferencesService)),
      ],
      child: Consumer<MainStore>(
          builder: (_, store, __) => Observer(
            builder: (_) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: Color(0xFF3B3B3B),
                  // primaryColor: Color(0xFFFFFFFF),
                  brightness:
                  store.settings.useDarkMode ? Brightness.dark : Brightness.light,
                ),
                home: HomeScreen(store),
                routes: {
                  //'main': (_) => MainScreen(store),
                  'home': (_) => HomeScreen(store),
                  'projects': (_) => ProjectsScreen(store),
                  'projectDetail': (_) => ProjectDetail(store),
                  'about': (_) => AboutScreen(store),
                  'contact': (_) => ContactScreen(store),
                  'settings': (_) => SettingsExample(store),
                  'portfolio': (_) => PortfolioScreen(store),
                  'portfolioDetail': (_) => PortfolioDetail(store),
                }),
          ),),);
}