import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  static const String routeName = '/messagePage';
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('消息'),
        actions: [
          FlatButton(
              onPressed: (){

              },
              child: Text('全部已读')),
        ],
      ),
      body: ListView.builder(itemBuilder:(context,index){
        return Column(
          children: [
            Center(child: Text('2020-5-31 17:19:20')),
            Text('系统通知'),
            Text('该商品由于[商品缺货]愿意，取消了采购订单。'),
          ],
        );
      }),
    );
  }
}
