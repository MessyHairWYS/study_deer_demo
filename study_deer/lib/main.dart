import 'package:flutter/material.dart';
import 'main_routers.dart';

void main() {
  runApp(MyApp());
}

///
///
///
/// adadad
///
///
///
class MyApp extends StatelessWidget {

  final String a = 'aaaaa';
  final String b = 'bbbbb';
  final String d = 'dddddd';
  final String f = 'ffffffffff';
  final String g = 'gggggggggg';

  final String c = 'ccccc';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'deer_study_aaaaaa',
      theme: ThemeData(
        backgroundColor: Colors.white,
        // splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
        // highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明

        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MainPage(),
      routes: KSDRouter.routes,
      initialRoute: KSDRouter.initialRoute,
      onUnknownRoute: KSDRouter.unknownRoute,
      // onGenerateInitialRoutes: [],
    );
  }
}
