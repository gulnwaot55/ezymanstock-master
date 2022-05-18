import 'dart:convert';
import 'package:http/http.dart' as http;

class http_manage {
  Future<dynamic> postJson(url, Map<String, dynamic> data) async {
    try {
      print(url);
      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JsonEncoder().convert(data),
      );

      print('HTTP Work');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
        throw Exception('Failed to create url.');
      }
    } catch (Exception) {}
  }
}
