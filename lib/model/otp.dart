import 'package:StockManager/helper/database_manage.dart';
import 'package:StockManager/helper/http_manage.dart';

class otp {
  String username;
  String ip;

  otp({this.username, this.ip});

  Future<dynamic> post() async {
    String _api = await DBManage().getAPI();

    Map<String, dynamic> data = {'username': username, 'ip': ip};

    String apiMode = 'login/ReqOTP';

    return await http_manage().postJson(_api + apiMode, data);
  }
}
  