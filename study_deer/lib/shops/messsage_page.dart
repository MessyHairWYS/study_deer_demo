import 'package:flutter/material.dart';

import '../res/colours.dart';
import '../res/gaps.dart';

class MessagePage extends StatefulWidget {
  static const String routeName = '/messagePage';
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<String> _message = [
    '你可以不要管',
    '你可以不要管',
    '你可以不要管',
    '该商品由于[商品缺货]愿意，取消了采购订单',
    '所以在京东购物，请你做好心理准备，要有足够的耐心等待，能经得起京东客服的折腾。做好把钱送给 京东人 买药吃的心理准备。',
    '由于缺货，想取消这笔交易，但却被京东商城“锁定”，以为解锁后就可以取消订单了',
    '后别上京东购物，本人深有体会，我在京东购物无数次，质量一般，产品大问题暂没发现。 服务态度很不好，习惯像踢皮球一样',
    '于是我就打客服（057165110980），客服给了一个账并说：“这是取消订单必要的操作”，让我在atm机前转账',
    '让我在atm机前转账，我觉得这些操作没安全保障，于是就没轻易转账，并问客服：“你们有什么保障让客户去做这些操作吗？”他说：“要我的工号吗？要我的身份证吗？”最后我并没有轻易转账。谁能告诉我这样的操作是'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('消息'),
        elevation: 0,
        actions: [
          FlatButton(onPressed: () {}, child: Text('全部已读')),
        ],
      ),
      body: ListView.builder(
          itemCount: _message.length,
          itemBuilder: (context, index) {
            return Column(children: [
              Center(
                  child: Text(
                '2020-5-31 17:19:20',
                style: TextStyle(fontSize: 12),
              )),
              Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('系统通知')),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colours.app_main,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: Text(_message[index]),
                    ),
                    Gaps.vGap10,
                    // ],
                  ],
                ),
              ),
              // Divider(),
            ]);
          }),
    );
  }
}
