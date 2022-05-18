import 'package:StockManager/helper/database_manage.dart';
import 'package:StockManager/helper/http_manage.dart';

class saveSign {
  String Token;
  String Bcode;
  String Pieces;

  saveSign({this.Token, this.Bcode, this.Pieces});

  Future<dynamic> post() async {
    String _api = await DBManage().getAPI();

    Map<String, dynamic> data = {'Token': Token, 'Bcode': Bcode, 'Pieces': Pieces};

    String apiMode = 'iclabel/Insert_New_ICLABEL';

    return await http_manage().postJson(_api + apiMode, data);
  }
}
