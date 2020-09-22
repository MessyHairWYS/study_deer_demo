
import 'package:flutter/material.dart';
import 'package:study_deer/main_page.dart';

class HYRouter {
  static final String initialRoute = MainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (ctx) => MainPage(),
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}