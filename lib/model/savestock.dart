import 'package:StockManager/helper/database_manage.dart';
import 'package:StockManager/helper/http_manage.dart';
import 'package:flutter/cupertino.dart';

class saveStock {
  String token;
  String id;
  String qtyoH2;
  String locatioN1;

  saveStock({this.token, this.id, this.qtyoH2,@required this.locatioN1});

  Future<dynamic> post() async {
    String _api = await DBManage().getAPI();

    Map<String, dynamic> data = {'token': token, 'id': id, 'qtyoH2': qtyoH2, 'locatioN1': locatioN1};

    String apiMode = 'ICMAS/UpdateICMASCheckStock';

    return await http_manage().postJson(_api + apiMode, data);
  }
}
