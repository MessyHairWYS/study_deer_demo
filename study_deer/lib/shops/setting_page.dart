import 'package:flutter/material.dart';
import 'package:study_deer/res/Images.dart';

class SettingPage extends StatefulWidget {
  static const String routeName = '/settingPage';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final List<String> _itemTitles = [
    '账号管理',
    '清除缓存',
    '夜间模式',
    '检查更新',
    '关于我们',
    '退出当前账号',
    '其他Demo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('设置'),
      ),
      body: ListView.builder(
          itemCount: _itemTitles.length,
          itemBuilder: (context, index) {
            return Column(children: [
              Container(
                height: 44,
                child: ListTile(
                  title: Text(_itemTitles[index]),
                  trailing: Images.arrowRight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Divider(),
              ),
            ]);
          }),
    );
  }
}
