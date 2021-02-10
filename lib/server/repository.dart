import 'package:app_events/server/check_connection_api.dart';
import 'package:app_events/server/get_data_ver.dart';

class ObjRepository {
  String path_DB;
  String login;
  String pass;
  String body_str;
  ObjRepository({this.path_DB, this.login, this.pass, this.body_str});

  CheckConnectionAPI _check_connection = CheckConnectionAPI();
  getDataVer _get_data_ver = getDataVer();

  Future<String> check_connection() =>
      _check_connection.fetchCheck(path_DB, login, pass, body_str);

  Future<DataVer> get_data() =>
      _get_data_ver.fetchDataVer(path_DB, login, pass);
}
