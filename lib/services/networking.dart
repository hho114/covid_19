import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  ///return jsonDecode
  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      // print("COME HERE");
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }



}
