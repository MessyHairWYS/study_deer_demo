
import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_deer/res/colours.dart';
import 'package:study_deer/res/gaps.dart';
import 'package:study_deer/res/styles.dart';

import '../../res/colours.dart';
import '../../res/gaps.dart';
import '../../res/styles.dart';


class ForgetPwdPage extends StatefulWidget {
  @override
  _ForgetPwdPageState createState() => _ForgetPwdPageState();
}

class _ForgetPwdPageState extends State<ForgetPwdPage> {

  final TapGestureRecognizer _registerRecognizer = TapGestureRecognizer();

  bool _smsClickable = true;

  //定义计时变量
  Timer _timer;
  int _countdownTime = 20;

  final _phoneController = TextEditingController();
  final _pwdController = TextEditingController();
  final _smsController = TextEditingController();


  bool _phoneFieldEmpty = true;
  bool _pwdFieldEmpty = true;
  bool _smsFieldEmpty = true;

  bool _doneClickable = false;

  _verify(){

  }

  @override
  void initState() {
    _registerRecognizer.onTap = (){
      print('_registerRecognizer tap');
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: _buildBody()
    );
  }

  void startCountdownTimer(){
    const oneSec = const Duration(seconds: 1);

    var callback = (timer){
      setState(() {
        if(_countdownTime < 1){
          _timer?.cancel();
          _smsClickable = true;
          _countdownTime = 20;
          // print('恢复成功');


        }else{
          _countdownTime = _countdownTime-1;
          _smsClickable = false;
          print(_countdownTime);
        }
      });
    };
    _timer = Timer.periodic(oneSec, callback);
  }


  _buildBody(){
    return SingleChildScrollView(
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text(
                '重置登录密码',
                style: TextStyles.textBold24,
              ),
            ),
            TextField(
              onChanged: (value){
                setState(() {
                  _phoneFieldEmpty = _phoneController.text.isEmpty;
                  _verify();
                });
              },

              controller: _phoneController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(11),
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              keyboardType:TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                suffix: _phoneFieldEmpty ? null:_phoneDeleteButton(),
                  hintText: '请输入手机号',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colours.app_main,
                          width: 0.5
                      )
                  ),
                  enabledBorder:UnderlineInputBorder(
                      borderSide:  BorderSide(
                          color: Colors.grey.shade300
                      )
                  )

              ),
            ),

            Gaps.vGap16,

            Stack(
              children: [
                TextField(
                  onChanged: (value){
                    setState(() {
                      _verify();
                    });
                  },
                  controller: _smsController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      hintText: '请输入验证码',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colours.app_main,
                              width: 0.5
                          )
                      ),

                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300
                          )
                      )
                  ),
                ),

                //获取验证码
                Container(
                  height: 30,
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    disabledColor:Colors.grey,
                    disabledTextColor: Colours.bg_color,
                    textColor: _smsClickable ? Colours.app_main:Colors.white,
                    splashColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side:BorderSide(width: 0.5,color: Colours.app_main),
                    ),
                    onPressed: _smsClickable ?
                        (){
                      setState(() {
                        startCountdownTimer();
                      });
                    }:null,

                    child:Text(
                      _smsClickable ? '获取验证码':'$_countdownTime'+' s',
                      style: TextStyle(
                        // color: _smsClickable ? Colours.app_main:Colors.white,
                        fontSize: 12,
                        // backgroundColor:_smsClickable ? Colors.white:Colours.bg_gray_,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Gaps.vGap10,


            TextField(
              onChanged: (value){
                setState(() {
                  _pwdFieldEmpty = _pwdController.text.isEmpty;
                  _verify();
                });
              },
              controller: _pwdController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(16)
              ],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                suffix: _pwdFieldEmpty ? null : _pwdDeleteButton(),
                  hintText: '请输入密码',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colours.app_main,
                          width: 0.5
                      )
                  ),

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
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,

                onPressed:_doneClickable ? (){
                  String phone = _phoneController.text;
                  String sms = _smsController.text;
                  String pwd = _pwdController.text;
                  print('phone=$phone sms=$sms pwd = $pwd');

                }:null,

                child: Text('确认',style: TextStyle(color: Colors.white,fontSize:18),),
              ),
            ),

          ],
        ),
      ),
    );
  }



  _phoneDeleteButton(){
    return  GestureDetector(
      onTap: (){
        setState(() {
          _phoneController.text = '';
          _phoneFieldEmpty = true;
          _verify();
        });
      },
      child: Container(
          width: 20,
          height: 20,
          child: Image.asset('assets/login/qyg_shop_icon_delete.png')),
    );
  }

  _pwdDeleteButton(){
    return  GestureDetector(
      onTap: (){
        setState(() {
          _pwdController.text = '';
          _pwdFieldEmpty = true;
          _verify();
        });
      },
      child: Container(
          width: 20,
          height: 20,
          child: Image.asset('assets/login/qyg_shop_icon_delete.png')),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(_timer != null){
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }
}
