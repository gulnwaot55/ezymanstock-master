import 'dart:ui';

import 'package:StockManager/helper/app_setting.dart';
import 'package:StockManager/helper/function.dart';
import 'package:StockManager/helper/globalData.dart';
import 'package:StockManager/helper/gradient_icon.dart';
import 'package:StockManager/helper/qrcode_manage.dart';
import 'package:StockManager/helper/sized_config.dart';
import 'package:StockManager/model/savestock.dart';
import 'package:StockManager/model/scanqr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class showQRCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _showQRCodeState();
  }
}

class _showQRCodeState extends State<showQRCode> {
  FocusNode _apiFocusNode;
  TextEditingController _controllerapi = new TextEditingController();

  dynamic data = {
    "ResponseStatus": "Waiting",
    "ResponseMessages": "",
    "ResponseData": [
      {
        "id": "",
        "bcode": "",
        "descr": "",
        "model": "",
        "brand": "",
        "vendor": "",
        "uI1": "",
        "locatioN1": "",
        "qtyoH2": 0.0
      }
    ]
  };

  @override
  void initState() {
    super.initState();
    _apiFocusNode = FocusNode();
    _getValue();
  }

  @override
  void dispose() {
    _apiFocusNode.dispose();
    super.dispose();
  }

  _getValue() async {
    scanQR scqr = scanQR(
        main: '',
        type: '2',
        strSearch: QRCode().getQRtext(),
        token: globalData.token);

    dynamic _info = await scqr.post();

    setState(() {
      data = _info;
      _controllerapi.text = data['ResponseData'][0]['qtyoH2'].toString();
    });
    // print('Work');
  }

  _apiFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_apiFocusNode);
    });
  }

  _onBack(context) {
    Navigator.of(context).pop();
  }

  _onSuccess() {
    data['ResponseData'][0]['qtyoH2'] =
        double.parse(_controllerapi.text).toStringAsFixed(1);
  }

  _onSave(context) async {
    if (_controllerapi.text != '') {
      if (double.tryParse(_controllerapi.text) != null) {
        // saveStock savSto = saveStock(
        //     id: data['ResponseData'][0]['id'].toString(),
        //     qtyoH2: _controllerapi.text,
        //     token: globalData.token);

        // dynamic status = await savSto.post();

        // print(status);

        // if (status['ResponseStatus'] == 'Ok') {
        //   function().showNotify(
        //       context: context,
        //       buttonText: Settings.notify['last_product']['Success']['button'],
        //       message: Settings.notify['last_product']['Success']['message'],
        //       title: Settings.notify['last_product']['Success']['title'],
        //       fn: () => {_onSuccess()});

        //   // print('Teee');
        // }
      } else {
        function().showNotify(
          context: context,
          buttonText: Settings.notify['last_product']['notNumber']['button'],
          message: Settings.notify['last_product']['notNumber']['message'],
          title: Settings.notify['last_product']['notNumber']['title'],
        );
      }
    } else {
      function().showNotify(
        context: context,
        buttonText: Settings.notify['last_product']['Empty']['button'],
        message: Settings.notify['last_product']['Empty']['message'],
        title: Settings.notify['last_product']['Empty']['title'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const double _paddingShowBetween = 8.0;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, -5.0),
              end: Alignment(1.0, 4.0),
              colors: [
                const Color.fromRGBO(0, 176, 155, 1),
                const Color.fromRGBO(103, 224, 63, 1)
              ],
            ),
          ),
        ),
        title: Text(Settings.language['Lastest_Product']['Title']),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 55 / 100,
                      width: MediaQuery.of(context).size.width * 90 / 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Settings.theme["font_color"],
                        boxShadow: [
                          BoxShadow(color: Colors.grey, spreadRadius: 1),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 11.0, right: 11),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: _paddingShowBetween),
                                child: Text(
                                  Settings.language['Lastest_Product']['bcode']
                                          .toString() +
                                      data['ResponseData'][0]['bcode']
                                          .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: _paddingShowBetween),
                                child: Text(
                                  Settings.language['Lastest_Product']['descr']
                                          .toString() +
                                      data['ResponseData'][0]['descr']
                                          .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: _paddingShowBetween),
                                child: Text(
                                  Settings.language['Lastest_Product']['model']
                                          .toString() +
                                      data['ResponseData'][0]['model']
                                          .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: _paddingShowBetween),
                                child: Text(
                                  Settings.language['Lastest_Product']['brand']
                                          .toString() +
                                      data['ResponseData'][0]['brand']
                                          .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: _paddingShowBetween),
                                child: Text(
                                  Settings.language['Lastest_Product']['vendor']
                                          .toString() +
                                      data['ResponseData'][0]['vendor']
                                          .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: _paddingShowBetween),
                                child: Text(
                                  Settings.language['Lastest_Product']['uI1']
                                          .toString() +
                                      data['ResponseData'][0]['uI1'].toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Text(
                                Settings.language['Lastest_Product']
                                            ['locatioN1']
                                        .toString() +
                                    data['ResponseData'][0]['locatioN1']
                                        .toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: _paddingShowBetween),
                                child: Row(
                                  children: [
                                    Text(
                                      Settings.language['Lastest_Product']
                                              ['qtyoH2']
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      data['ResponseData'][0]['qtyoH2']
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: SizeConfig.safeBlockVertical * 9,
                                    right: MediaQuery.of(context).size.width *
                                        5 /
                                        100,),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    FontAwesomeIcons.boxOpen,
                                    size: 65,
                                    color: Color.fromRGBO(72, 210, 90, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onTap: () => {_apiFocus()},
                      focusNode: _apiFocusNode,
                      controller: _controllerapi,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                      ],
                      decoration: InputDecoration(
                        labelText: Settings.language['Lastest_Product']
                            ['Textbox_Count'],
                        labelStyle: GoogleFonts.prompt(
                          fontSize: 18,
                          color: _apiFocusNode.hasFocus
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
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width * 90 / 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-1.0, -5.0),
                          end: Alignment(1.0, 4.0),
                          colors: [
                            const Color.fromRGBO(0, 176, 155, 1),
                            const Color.fromRGBO(103, 224, 63, 1)
                          ],
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () => {_onSave(context)},
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(
                                FontAwesomeIcons.solidSave,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              Settings.language['Lastest_Product']
                                  ['Button_Save'],
                              style: TextStyle(
                                  color: Settings.theme["font_color"],
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
