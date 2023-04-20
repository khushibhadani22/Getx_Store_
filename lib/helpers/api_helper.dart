import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();
  String api = "https://dummyjson.com/products?limit=10";
  Future<List?> getApiData() async {
    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body);
      List allData = data['products'];

      return allData;
    } else {
      return null;
    }
  }
}
