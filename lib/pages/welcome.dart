import 'dart:ui';

import 'package:StockManager/helper/app_setting.dart';
import 'package:StockManager/helper/database_manage.dart';
import 'package:StockManager/helper/gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';

class welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _welcomeState();
  }
}

class _welcomeState extends State<welcome> {
  double _welcomeOpacity = 0;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        _welcomeOpacity = 1;
      });
    });
    super.initState();
  }

  _onEnd(context) async {
    await DBManage().initDatabase();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => login(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: AnimatedOpacity(
              opacity: _welcomeOpacity,
              duration: new Duration(seconds: 2, microseconds: 500),
              onEnd: () => {_onEnd(context)},
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Hero(
                            tag: 'logo',
                            child: Image.asset(
                              Settings.theme['logo'],
                              scale: 3,
                            ),
                          )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: GradientText(
                          Settings.language['Welcome'],
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(0, 176, 155, 1),
                            Color.fromRGBO(103, 224, 63, 1)
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
