import 'package:app_events/app_state/app_state.dart';
import 'package:app_events/app_state/save_state_data.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      login: loginReducer(state.login, action),
      pass: passReducer(state.pass, action),
      name_db: nameReducer(state.name_db, action),
      path_db: pathReducer(state.path_db, action),
      token: tokenReducer(state.token, action));
}

final loginReducer = TypedReducer<String, SetLogin>(_loginReducer);
String _loginReducer(String name, SetLogin action) {
  return action.login;
}

final passReducer = TypedReducer<String, SetPass>(_passReducer);
String _passReducer(String name, SetPass action) {
  return action.pass;
}

final nameReducer = TypedReducer<String, SetNameDB>(_nameReducer);
String _nameReducer(String name, SetNameDB action) {
  return action.nameDB;
}

final pathReducer = TypedReducer<String, SetPathDB>(_pathReducer);
String _pathReducer(String name, SetPathDB action) {
  return action.pathDB;
}

final tokenReducer = TypedReducer<String, SetToken>(_tokenReducer);
String _tokenReducer(String name, SetToken action) {
  return action.token;
}
