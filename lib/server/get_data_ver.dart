import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class getDataVer {
  Future<DataVer> fetchDataVer(
      String path_DB, String login, String pass) async {
    var authHeader = '${base64.encode(utf8.encode('$login:$pass'))}';
    var response = await http.post(path_DB + 'hs/info_mobile/get_data/',
        headers: {HttpHeaders.authorizationHeader: "Basic $authHeader"});
    if (response.statusCode == 200) {
      return DataVer.fromJson(json.decode(response.body));
    } else {
      return Future.error('Ошибка получения данных');
    }
  }
}

class DataVer {
  String platform;
  String name;
  String ver;

  DataVer({this.platform, this.name, this.ver});

  DataVer.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    name = json['name'];
    ver = json['ver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['platform'] = this.platform;
    data['name'] = this.name;
    data['ver'] = this.ver;
    return data;
  }
}
