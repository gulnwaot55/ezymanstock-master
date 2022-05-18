import 'package:StockManager/helper/app_setting.dart';
import 'package:StockManager/helper/function.dart';
import 'package:StockManager/helper/globalData.dart';
import 'package:StockManager/model/scanqr.dart';
import 'package:StockManager/pages/home.dart';
import 'package:StockManager/pages/manageproduct.dart';
import 'package:StockManager/pages/editproductsign.dart';
import 'package:StockManager/pages/showqr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


// import 'app_setting.dart';
// import 'function.dart';

class QRCodes {
  static String _QRtexts = 'Unknown';

  Future<void> openQRCameras(context, {editAmount}) async {
    String _Codes;
    try {
      _Codes = await FlutterBarcodeScanner.scanBarcode(
          Settings.language['QRCamera']['Color'],
          Settings.language['QRCamera']['Cancel'],
          Settings.language['QRCamera']['Flash'],
          ScanMode.DEFAULT);

      // _Code = "5000000005";

      if (_Codes != "-1") {
        scanQR scqr = scanQR(
            main: '', type: '2', strSearch: _Codes, token: globalData.token);

        dynamic _info = await scqr.post();
        print(_info);
        if (_info['ResponseStatus'] == "Ok") {
          _QRtexts = _Codes;
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
    return _QRtexts;
  }

  setQRtext(String value) {
    _QRtexts = value;
  }
}
