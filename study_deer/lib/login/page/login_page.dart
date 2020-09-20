
import 'package:flutter/material.dart';
import 'package:study_deer/res/colours.dart';
import 'package:study_deer/res/gaps.dart';
import 'package:study_deer/res/styles.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
              onTap: (){
                print('GestureDetector');
              },
                child: Container(
                    padding: EdgeInsets.all(12),
                    child: Text('验证码登录',style: TextStyle(color: Colors.black,),)))
          ],
        ),
        body: _buildBody()
    );
  }

  _buildBody(){
    return SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  '密码登录',
                  style: TextStyles.textBold24,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: '请输入账号',
                  enabledBorder:UnderlineInputBorder(
                    borderSide:  BorderSide(
                        color: Colors.grey.shade300
                    )
                  )

                ),
              ),

              Gaps.vGap16,

              TextField(
                decoration: InputDecoration(
                    hintText: '请输入密码',
                    enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300
                    )
                  )
                ),
              ),

              Gaps.vGap16,

              Container(
                height: 44,
                width: double.infinity,
                child: FlatButton(
                    onPressed:(){

                    },
                  color: Colors.blue,
                  child: Text('登录',style: TextStyle(color: Colors.white,fontSize:18),),
                ),
              ),

              Gaps.vGap8,

              GestureDetector(
                onTap: (){
                  print('GestureDetector');
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(12),
                    child: Text('忘记密码')),
              ),

              Gaps.vGap32,

              GestureDetector(
                onTap: (){
                  print('GestureDetector');
                },
                child: Container(
                    padding: EdgeInsets.all(12),
                    child: Text('还没有账号？快去注册',style: TextStyle(color: Colors.blue),)),
              ),
            ],
          ),
        ),
    );
  }
}
