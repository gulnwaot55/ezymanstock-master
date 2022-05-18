// ignore_for_file: unused_field, camel_case_types

// import 'dart:html';

import 'package:StockManager/helper/app_setting.dart';
import 'package:StockManager/helper/function.dart';
import 'package:StockManager/helper/globalData.dart';
import 'package:StockManager/model/otp.dart';
import 'package:StockManager/model/userlogin.dart';
import 'package:StockManager/pages/home.dart';
import 'package:StockManager/pages/setup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:StockManager/helper/database_manage.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginState();
  }
}

class _loginState extends State<login> {
  FocusNode _usernameFocusNode;
  FocusNode _otpFocusNode;

  TextEditingController _controllerUsername = new TextEditingController();
  TextEditingController _controllerOTP = new TextEditingController();

  bool switchValue = false;

  String _debugText = "test";

  @override
  void initState() {
    super.initState();
    _usernameFocusNode = FocusNode();
    _otpFocusNode = FocusNode();
    _loadStatus();
  }

  _loadStatus() async {
    switchValue = await DBManage().getStatus();
    setState(() {
      switchValue = switchValue;
    });
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  _usernameFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_usernameFocusNode);
    });
  }

  _otpFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_otpFocusNode);
    });
  }

  _onLogin(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
  } //Bypass Login
  
  // _onLogin(context) async {
  //   if (_controllerUsername.text != '') {
  //     if (_controllerOTP.text != '') {
  //       user us = user(
  //           username: _controllerUsername.text, password: _controllerOTP.text);
  //       dynamic data = await us.post();
  //       if (data['ResponseStatus'] == 'Ok') {
  //         globalData.token = data['ResponseData']['token'];
  //         globalData.login_name =
  //             "${data['ResponseData']['firstname']} ${data['ResponseData']['lastname']}";

  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => home()));
  //       } else {
  //         function().showNotify(
  //           context: context,
  //           title: Settings.notify['Login']['Failed']['title'],
  //           message: Settings.notify['Login']['Failed']['message'],
  //           buttonText: Settings.notify['Login']['Failed']['button'],
  //         );
  //       }
  //     } else {
  //       function().showNotify(
  //         context: context,
  //         title: Settings.notify['Login']['OTP_input']['title'],
  //         message: Settings.notify['Login']['OTP_input']['message'],
  //         buttonText: Settings.notify['Login']['OTP_input']['button'],
  //       );
  //     }
  //   } else {
  //     function().showNotify(
  //       context: context,
  //       title: Settings.notify['Login']['Username_input']['title'],
  //       message: Settings.notify['Login']['Username_input']['message'],
  //       buttonText: Settings.notify['Login']['Username_input']['button'],
  //     );
  //   }
  // }

  _onGetOTP(context) async {
    if (_controllerUsername.text != '') {
      otp code = new otp(username: _controllerUsername.text, ip: 'CheckStock');

      dynamic data = await code.post();
      print(data);

      if (data['ResponseStatus'] == 'Ok') {
        function().showNotify(
          context: context,
          title: Settings.notify['Login']['OTP_Success']['title'],
          message: Settings.notify['Login']['OTP_Success']['message'],
          buttonText: Settings.notify['Login']['OTP_Success']['button'],
        );
      } else {
        function().showNotify(
          context: context,
          title: Settings.notify['Login']['OTP_Notfound']['title'],
          message: Settings.notify['Login']['OTP_Notfound']['message'],
          buttonText: Settings.notify['Login']['OTP_Notfound']['button'],
        );
      }
    } else {
      function().showNotify(
        context: context,
        title: Settings.notify['Username_input']['OTP_Notfound']['title'],
        message: Settings.notify['Username_input']['OTP_Notfound']['message'],
        buttonText: Settings.notify['Username_input']['OTP_Notfound']['button'],
      );
    }
  }

  _onSetup(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => setup()));
  }

  _onSwitch(value) async {
    DBManage().setStatus(value);
    setState(() {
      switchValue = value;
    });
    print(await DBManage().getAPI());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {},
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? AppBar(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Settings.theme['color'],
                      size: 30,
                    ),
                    onPressed: () => {_onSetup(context)},
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  actions: [
                    Row(
                      children: [
                        Text((switchValue ? 'Online' : 'Local'),
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        Switch(
                          value: switchValue,
                          activeColor: Settings.theme["color"],
                          onChanged: (bool value) {
                            _onSwitch(value);
                          },
                        ),
                      ],
                    ),
                  ],
                )
              : null,
          body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 50 / 100,
                              child: Image.asset(
                                Settings.theme['logo'],
                                scale: 2.2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          60 /
                                          100,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              12 /
                                              100,
                                      child: TextFormField(
                                        onTap: () => {_usernameFocus()},
                                        focusNode: _usernameFocusNode,
                                        controller: _controllerUsername,
                                        decoration: InputDecoration(
                                          labelText: Settings.language['Login']
                                              ['Textbox_Username'],
                                          labelStyle: GoogleFonts.prompt(
                                            fontSize: 18,
                                            color: _usernameFocusNode.hasFocus
                                                ? Settings.theme['nearcolor']
                                                : Colors.grey,
                                          ),
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Settings.theme['color'],
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(25.0),
                                                topLeft: Radius.circular(25.0)),
                                          ),
                                          //fillColor: Colors.green
                                        ),
                                      )),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          30 /
                                          100,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              12 /
                                              100,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(50),
                                                topRight: Radius.circular(50)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey[300],
                                                  blurRadius: 1,
                                                  offset: Offset(-2.3, 0.0)),
                                            ]),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25),
                                                topRight: Radius.circular(25)),
                                            gradient: LinearGradient(
                                              begin: Alignment(-1.0, -5.0),
                                              end: Alignment(1.0, 0.0),
                                              colors: [
                                                const Color.fromRGBO(
                                                    0, 176, 155, 1),
                                                const Color.fromRGBO(
                                                    103, 224, 63, 1)
                                              ],
                                            ),
                                          ),
                                          // ignore: deprecated_member_use
                                          child: FlatButton(
                                              onPressed: () =>
                                                  {_onGetOTP(context)},
                                              child: Text(
                                                Settings.language['Login']
                                                    ['Ver_Button_GetOTP'],
                                                style: GoogleFonts.prompt(
                                                    fontSize: 18,
                                                    color: Settings
                                                        .theme["font_color"]),
                                              ),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25)),
                                              )),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          90 /
                                          100,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              12 /
                                              100,
                                      child: TextFormField(
                                        focusNode: _otpFocusNode,
                                        controller: _controllerOTP,
                                        onTap: () => {_otpFocus()},
                                        decoration: InputDecoration(
                                          labelText: Settings.language['Login']
                                              ['Textbox_OTP'],
                                          labelStyle: GoogleFonts.prompt(
                                            fontSize: 18,
                                            color: _otpFocusNode.hasFocus
                                                ? Settings.theme['nearcolor']
                                                : Colors.grey,
                                          ),
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Settings.theme['color'],
                                              ),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(0),
                                                  bottomRight:
                                                      Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(4),
                                                  topLeft: Radius.circular(4))),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          //fillColor: Colors.green
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 90 / 100,
                            height: 58,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey[300],
                                        blurRadius: 5,
                                        offset: Offset(0.0, 4.0)),
                                  ]),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  gradient: LinearGradient(
                                    begin: Alignment(-1.0, -4.0),
                                    end: Alignment(1.0, 4.0),
                                    colors: [
                                      const Color.fromRGBO(0, 176, 155, 1),
                                      const Color.fromRGBO(103, 224, 63, 1)
                                    ],
                                  ),
                                ),
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                    onPressed: () => {_onLogin(context)},
                                    child: Text(
                                      Settings.language['Login']
                                          ['Button_Login'],
                                      style: GoogleFonts.prompt(
                                          fontSize: 18,
                                          color: Settings.theme["font_color"]),
                                    ),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    )),
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
