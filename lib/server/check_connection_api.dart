import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class CheckConnectionAPI {
  Future<String> fetchCheck(
      String path_DB, String login, String pass, String body_str) async {
    var authHeader = '${base64.encode(utf8.encode('$login:$pass'))}';
    var response = await http.post(
        path_DB + 'hs/info_mobile/check_connection/check',
        body: body_str,
        headers: {HttpHeaders.authorizationHeader: "Basic $authHeader"});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'error';
    }
  }
}
