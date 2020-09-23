
import 'package:flutter/material.dart';
import 'package:study_deer/main_page.dart';

import 'shops/messsage_page.dart';
import 'shops/setting_page.dart';

class KSDRouter {
  static final String initialRoute = MainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (ctx) => MainPage(),
    MessagePage.routeName :(ctx) => MessagePage(),
    SettingPage.routeName:(ctx) => SettingPage()
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
