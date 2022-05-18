import 'package:StockManager/helper/database_manage.dart';
import 'package:StockManager/helper/http_manage.dart';

class user {
  String username;
  String password;

  user({this.username, this.password});

  Future<dynamic> post() async {
    String _api = await DBManage().getAPI();

    Map<String, dynamic> data = {'username': username, 'password': password};

    String apiMode = 'login/login';

    return await http_manage().postJson(_api+apiMode, data);
  }
}
