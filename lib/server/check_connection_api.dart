import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class CheckConnectionAPI {
  Future<String> fetchCheck(String path_DB, String login, String pass) async {
    var authHeader = '${base64.encode(utf8.encode('$login:$pass'))}';
    var response = await http.post(
        'http://sql1.1caero.ru:1086/tr_ka/hs/info_mobile/check_connection/check',
        headers: {HttpHeaders.authorizationHeader: "Basic $authHeader"});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'error';
    }
  }
}
