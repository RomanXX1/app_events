import 'package:app_events/server/check_connection_api.dart';

class ObjRepository {
  String path_DB;
  String login;
  String pass;
  ObjRepository({this.path_DB, this.login, this.pass});

  CheckConnectionAPI _check_connection = CheckConnectionAPI();

  Future<String> check_connection() =>
      _check_connection.fetchCheck(path_DB, login, pass);
}
