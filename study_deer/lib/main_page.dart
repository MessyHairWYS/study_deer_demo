import 'package:flutter/material.dart';
import 'package:study_deer/goods/goods_page.dart';
import 'package:study_deer/orders/orders_page.dart';
import 'package:study_deer/res/colours.dart';

import 'shops/shops_page.dart';
import 'statistics/statistics_page.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          OrdersPage(),
          GoodsPage(),
          StatisticsPage(),
          ShopsPage()
        ],
    ),
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colours.app_main,
        items: [
          BottomNavigationBarItem(
            title: Text('订单'),
            icon:Image.asset('assets/home/icon_order.png',height: 20,width: 20,color: Colours.text_gray,),
            activeIcon: Image.asset('assets/home/icon_order.png',height: 20,width: 20,color: Colours.app_main,),
          ),

          BottomNavigationBarItem(
              title: Text('商品'),
              icon:Image.asset('assets/home/icon_commodity.png',height: 20,width: 20,color: Colours.text_gray,),
              activeIcon: Image.asset('assets/home/icon_commodity.png',height: 20,width: 20,color: Colours.app_main,),

          ),

          BottomNavigationBarItem(
              title: Text('统计'),
              icon:Image.asset('assets/home/icon_statistics.png',height: 20,width: 20,color: Colours.text_gray,),
              activeIcon: Image.asset('assets/home/icon_statistics.png',height: 20,width: 20,color: Colours.app_main,),

    ),

          BottomNavigationBarItem(
              title: Text('店铺'),
              icon:Image.asset('assets/home/icon_order.png',height: 20,width: 20,color: Colours.text_gray,),
              activeIcon: Image.asset('assets/home/icon_order.png',height: 20,width: 20,color: Colours.app_main,),

    ),
        ],
        onTap:(index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
