
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_deer/login/page/register_page.dart';
import 'package:study_deer/login/page/sms_login_page.dart';
import 'package:study_deer/res/colours.dart';
import 'package:study_deer/res/gaps.dart';
import 'package:study_deer/res/styles.dart';

import 'forget_pwd_page.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _accountController = TextEditingController();
  final _pwdController = TextEditingController();

  bool _accountFieldEmpty = true;
  bool _pwdFieldEmpty = true;
  bool _pwdShowable = true;
  bool _loginClickable = false;

  final _accountFocusNode = FocusNode();
  final _pwdFocusNode = FocusNode();


  ///验证能否登录
  void _verify(){
    String account = _accountController.text;
    String pwd = _pwdController.text;

    bool loginClickable = true;

    if(account.isEmpty || account.length < 11){
      loginClickable = false;
    }
    if(pwd.isEmpty || pwd.length < 6){
      loginClickable = false;
    }
    if(_loginClickable != loginClickable){
      setState(() {
        _loginClickable = loginClickable;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _accountFocusNode.addListener(() {
        if(_accountFocusNode.hasFocus){
          // print('_accountFocusNode 获得焦点');
        }else{
          // print('_accountFocusNode 失去焦点');
        }
    });

    _pwdFocusNode.addListener(() {
      if(_pwdFocusNode.hasFocus){
        // print('_pwdFocusNode 获得焦点');
      }else{
        // print('_pwdFocusNode 失去焦点');
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context)=>SMSLoginPage())
                  );
              },
                child: Container(
                    padding: EdgeInsets.all(12),
                    child: Text('验证码登录',style: TextStyle(color: Colors.black,),)))
          ],
        ),
        body: _buildBody(context)
    );
  }

  _buildBody(BuildContext context){
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
                focusNode: _accountFocusNode,
                autofocus: true,
                // style: TextStyle(fontSize: 14),
                onChanged: (value){
                  setState(() {
                    _accountFieldEmpty = _accountController.text.isEmpty;
                    _verify();
                  });
                },

                controller: _accountController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                keyboardType:TextInputType.number,
                decoration: InputDecoration(

                  //field的大小不能小于 clear_icon 否则删除时布局会浮动

                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  suffix: _accountFieldEmpty ? null
                      :GestureDetector(
                        onTap: (){
                          setState(() {
                            _accountController.text = '';
                            _accountFieldEmpty = true;
                            _verify();
                          });
                        },
                        child: Image.asset('assets/login/qyg_shop_icon_delete.png',height: 20,width: 20,)
                  ),

                  hintText: '请输入账号',
                    // hintStyle: TextStyle(fontSize: 14),
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

              Gaps.vGap8,

              TextField(
                focusNode: _pwdFocusNode,
                onChanged: (value){
                  setState(() {
                    _pwdFieldEmpty = _pwdController.text.isEmpty;
                    _verify();
                  });
                },
                obscureText:_pwdShowable,
                controller: _pwdController,
                keyboardType: TextInputType.visiblePassword,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(16),
                ],
                // maxLength: 16,
                // maxLengthEnforced:true,
                decoration: InputDecoration(
                    // contentPadding: EdgeInsets.symmetric(vertical: 10),
                    suffix:Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                      // color: Colours.red,
                      width: 70,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _pwdFieldEmpty ? SizedBox():_pwdDeleteButton(),
                          Gaps.hGap10,
                          _showPwdButton(),
                        ],
                      ),
                    ),

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
                    textColor: Colors.white,
                    color:Colours.app_main,
                    disabledColor: Colours.text_gray_c,
                    disabledTextColor: Colors.white,

                    onPressed:_loginClickable ? (){
                      //收回键盘
                      _accountFocusNode.unfocus();
                      _pwdFocusNode.unfocus();

                      ///登录
                      String account = _accountController.text;
                      String pwd = _pwdController.text;

                      print('login account = $account pwd = $pwd');
                    }
                    :null,

                  // color: Colors.blue,
                  child: Text('登录',style: TextStyle(color: Colors.white,fontSize:18),),
                ),
              ),

              Gaps.vGap8,

              GestureDetector(
                onTap: (){

                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_)=>ForgetPwdPage()
                      )
                  );

                },
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(12),
                    child: Text('忘记密码')),
              ),

              Gaps.vGap32,

              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_)=>RegisterPage()
                    )
                  );
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

  _showPwdButton(){
    return GestureDetector(
      onTap: (){
        setState(() {
          _pwdShowable = !_pwdShowable;
        });
      },
      child: Image.asset(
        _pwdShowable ? 'assets/login/qyg_shop_icon_hide.png'
            :'assets/login/qyg_shop_icon_display.png',
        fit: BoxFit.fill,
        width: 20,
        height: 20,
      ),
    );
  }

  @override
  void dispose() {

    _accountFocusNode?.dispose();
    _pwdFocusNode?.dispose();
    super.dispose();
  }

}
