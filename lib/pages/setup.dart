import 'package:StockManager/helper/app_setting.dart';
import 'package:StockManager/helper/database_manage.dart';
import 'package:StockManager/helper/function.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class setup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _setupState();
  }
}

class _setupState extends State<setup> {
  FocusNode _apiFocusNode;
  FocusNode _api2FocusNode;
  TextEditingController _controllerText = new TextEditingController();
  TextEditingController _controllerText2 = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _apiFocusNode = FocusNode();
    _api2FocusNode = FocusNode();
    setAPI();
  }

  @override
  void dispose() {
    _apiFocusNode.dispose();
    _api2FocusNode.dispose();
    super.dispose();
  }

  setAPI() async {
    String _api = await DBManage().getAPI1();
    String _api2 = await DBManage().getAPI2();

    print(_api);
    print(_api2);
    setState(() {
      _controllerText.text = _api;
      _controllerText2.text = _api2;
    });
  }

  _apiFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_apiFocusNode);
    });
  }

  _api2Focus() {
    setState(() {
      FocusScope.of(context).requestFocus(_api2FocusNode);
    });
  }

  _onBack(context) {
    Navigator.of(context).pop();
  }

  _onSave(context) async {
    if (_controllerText.text != '' && _controllerText2.text != '') {
      DBManage()
          .setAPI(api1: _controllerText.text, api2: _controllerText2.text);
      function().showNotify(
          context: context,
          title: Settings.notify['setup']['Success']['title'],
          message: Settings.notify['setup']['Success']['message'],
          buttonText: Settings.notify['setup']['Success']['button'],
          fn: () {
            Future.delayed(Duration(milliseconds: 350))
                .then((value) => _onBack(context));
          });
      setState(() {
        FocusScope.of(context).unfocus();
      });
    } else {
      function().showNotify(
        context: context,
        title: Settings.notify['setup']['Failed']['title'],
        message: Settings.notify['setup']['Failed']['message'],
        buttonText: Settings.notify['setup']['Failed']['button'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 90 / 100,
                        child: TextFormField(
                          onTap: () => {_apiFocus()},
                          controller: _controllerText,
                          focusNode: _apiFocusNode,
                          decoration: InputDecoration(
                            labelText: Settings.language['Setup']['Api1'],
                            labelStyle: GoogleFonts.prompt(
                              fontSize: 18,
                              color: (_apiFocusNode.hasFocus)
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
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            //fillColor: Colors.green
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 90 / 100,
                          child: TextFormField(
                            onTap: () => {_api2Focus()},
                            controller: _controllerText2,
                            focusNode: _api2FocusNode,
                            decoration: InputDecoration(
                              labelText: Settings.language['Setup']['Api2'],
                              labelStyle: GoogleFonts.prompt(
                                fontSize: 18,
                                color: (_api2FocusNode.hasFocus)
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
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              //fillColor: Colors.green
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 90 / 100,
                      height: 58,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 5,
                                  offset: Offset(0.0, 4.0)),
                            ]),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient: LinearGradient(
                              begin: Alignment(-1.0, -4.0),
                              end: Alignment(1.0, 4.0),
                              colors: [
                                const Color.fromRGBO(0, 176, 155, 1),
                                const Color.fromRGBO(103, 224, 63, 1)
                              ],
                            ),
                          ),
                          child: FlatButton(
                              onPressed: () => {_onSave(context)},
                              child: Text(
                                Settings.language['Setup']['Save'],
                                style: GoogleFonts.prompt(
                                    fontSize: 18, color: Colors.white),
                              ),
                              shape: new RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              )),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 90 / 100,
                        height: 58,
                        child: OutlineButton(
                            onPressed: () => {_onBack(context)},
                            child: Text(
                              Settings.language['Setup']['Back'],
                              style: GoogleFonts.prompt(
                                  fontSize: 18, color: Settings.theme['color']),
                            ),
                            borderSide: BorderSide(
                                color: Settings.theme['color'], width: 3),
                            highlightedBorderColor: Settings.theme['color'],
                            shape: new RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
