
import 'package:flutter/material.dart';
import 'package:study_deer/res/gaps.dart';
import 'package:study_deer/shops/messsage_page.dart';
import 'package:study_deer/shops/setting_page.dart';

class ShopsPage extends StatefulWidget {
  @override
  _ShopsPageState createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {

  final List<String> _menuTitle = ['账户流水', '资金管理', '提现账号'];
  final List<String> _menuImage = ['zhls', 'zjgl', 'txzh'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Image.asset('assets/shop/message.png',width: 24,height: 24,),
            onPressed: (){
                Navigator.of(context).pushNamed(MessagePage.routeName);
            },
          ),

          IconButton(
            icon: Image.asset('assets/shop/setting.png',width: 24,height: 24),
            onPressed: (){
              Navigator.of(context).pushNamed(SettingPage.routeName);
            },
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileContent(),
            Gaps.vGap12,
            Divider(),
            Gaps.vGap12,
            Text('账户',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Gaps.vGap16,
            _accountView(),
            Divider(),
            Gaps.vGap12,
            Text('店铺',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Gaps.vGap16,
            _shopView(),
          ],
        ),
      ),
    );
  }

  _profileContent(){
    return Stack(
      children: [
        ///stack中，用一个空的SizeBox占位
        SizedBox(width: double.infinity,height: 56),
        Positioned(
            left: 0,
            top: 0,
            child: Text('官方直营店',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/shop/zybq.png',width: 48,height: 18,)
        ),
        Positioned(
            left: 56,
            bottom: 0,
            child: Text('店铺账号:1233131313',style: TextStyle(fontSize: 12),)
        ),
        Positioned(
            right: 0,
            top: 0,
            child: Image.asset('assets/shop/tx.png',width: 44,height: 44,)
        ),
      ]
    );
  }

  _accountView(){
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 0),
        shrinkWrap:true, ///内容包裹
        itemCount:3,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:4,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (context,index){
          return Column(
            children: [
              Image.asset('assets/shop/'+_menuImage[index]+'.png',width: 32,),
              Text(_menuTitle[index],style: TextStyle(fontSize: 12),),
            ],
          );
        }
    );
  }

  _shopView(){
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 0),
        shrinkWrap:true, ///内容包裹
        itemCount:1,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:4,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (context,index){
          return Column(
            children: [
              Image.asset('assets/shop/dpsz.png',width: 32,),
              Text('店铺设置',style: TextStyle(fontSize: 12),),
            ],
          );
        }
    );
  }

}
