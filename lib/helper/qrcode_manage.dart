import 'package:StockManager/helper/globalData.dart';
import 'package:StockManager/model/scanqr.dart';
import 'package:StockManager/pages/home.dart';
import 'package:StockManager/pages/manageproduct.dart';
import 'package:StockManager/pages/editproductsign.dart';
import 'package:StockManager/pages/showqr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'app_setting.dart';
import 'function.dart';

class QRCode {
  static String _QRtext = 'Unknown';

  Future<void> openQRCamera(context, {editAmount}) async {
    String _Code;
    try {
      _Code = await FlutterBarcodeScanner.scanBarcode(
          Settings.language['QRCamera']['Color'],
          Settings.language['QRCamera']['Cancel'],
          Settings.language['QRCamera']['Flash'],
          ScanMode.DEFAULT);

      // _Code = "5000000005";

      if (_Code != "-1") {
        scanQR scqr = scanQR(
            main: '', type: '2', strSearch: _Code, token: globalData.token);

        dynamic _info = await scqr.post();
        print(_info);
        if (_info['ResponseStatus'] == "Ok") {
          _QRtext = _Code;
          if (editAmount == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => manageProduct())); //using
          } else if (editAmount == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => showQRCode()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => editProductSign()));
          }
        } else {
          function().showNotify(
            context: context,
            title: Settings.notify['ScanProduct']['Notfound_Product']['title'],
            message: Settings.notify['ScanProduct']['Notfound_Product']
                ['message'],
            buttonText: Settings.notify['ScanProduct']['Notfound_Product']
                ['button'],
          );
        }
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      }
    } finally {}
  }

  getQRtext() {
    return _QRtext;
  }

  setQRtext(String value) {
    _QRtext = value;
  }
}
