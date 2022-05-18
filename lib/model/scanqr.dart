import 'package:StockManager/helper/database_manage.dart';
import 'package:StockManager/helper/http_manage.dart';

class scanQR {
  String token;
  String strSearch;
  String main;
  String type;

  scanQR({this.token, this.strSearch, this.main, this.type});

  Future<dynamic> post() async {
    String _api = await DBManage().getAPI();

    Map<String, dynamic> data = {
      'token': token,
      'StrSearch': strSearch,
      'Main': main,
      'Type': type
    };

    String apiMode = 'ICMAS/GetICMAS_Stock';

    return await http_manage().postJson(_api + apiMode, data);
  }
}
