import 'package:app_events/activities/enter_actitvities/android/work_activity_android.dart';
import 'package:app_events/app_state/app_state.dart';
import 'package:app_events/app_state/save_state_data.dart';
import 'package:app_events/server/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginActivity_Android extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActivityState();
  }
}

class ActivityState extends StatefulWidget {
  @override
  _ActivityStateState createState() => _ActivityStateState();
}

class _ActivityStateState extends State<ActivityState> {
  String name = '';
  String path = '';
  String login = '';
  String pass = '';
  String token = '';

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  _loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      path = prefs.getString('path') ?? '';
      login = prefs.getString('login') ?? '';
      pass = prefs.getString('pass') ?? '';
      token = prefs.getString('token') ?? '';

      if (path == '') {
        path = 'http://sql1.1caero.ru:1086/tr_ka/';
      }

      StoreProvider.of<AppState>(context).dispatch(SetNameDB(name));
      StoreProvider.of<AppState>(context).dispatch(SetPathDB(path));
      StoreProvider.of<AppState>(context).dispatch(SetLogin(login));
      StoreProvider.of<AppState>(context).dispatch(SetPass(pass));
      StoreProvider.of<AppState>(context).dispatch(SetToken(token));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 64.0, left: 32.0, right: 32.0),
            child: TextFormField(
              onChanged: (value) => {
                StoreProvider.of<AppState>(context).dispatch(SetNameDB(value)),
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Название подключения",
                icon: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Icon(
                    Icons.bookmark,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                  ),
                ),
              ),
              controller: TextEditingController.fromValue(TextEditingValue(
                text: name,
                // selection: TextSelection.collapsed(
                //     offset: name == "" ? 0 : name.length),
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
            child: TextFormField(
              onChanged: (value) => {
                StoreProvider.of<AppState>(context).dispatch(SetPathDB(value)),
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Путь к информационной базе",
                icon: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Icon(
                    Icons.language,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                  ),
                ),
              ),
              controller: TextEditingController.fromValue(TextEditingValue(
                text: path,
                // selection: TextSelection.collapsed(
                //     offset: name == "" ? 0 : name.length),
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
            child: TextFormField(
              onChanged: (value) => {
                StoreProvider.of<AppState>(context).dispatch(SetLogin(value)),
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Имя пользователя",
                icon: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Icon(
                    Icons.ac_unit,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                  ),
                ),
              ),
              controller: TextEditingController.fromValue(TextEditingValue(
                text: login,
                // selection: TextSelection.collapsed(
                //     offset: name == "" ? 0 : name.length),
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
            child: TextFormField(
              onChanged: (value) => {
                StoreProvider.of<AppState>(context).dispatch(SetPass(value)),
              },
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Пароль",
                icon: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                  ),
                ),
              ),
              controller: TextEditingController.fromValue(TextEditingValue(
                text: pass,
                // selection: TextSelection.collapsed(
                //     offset: name == "" ? 0 : name.length),
              )),
            ),
          ),
          Btn_Enter_State(),
        ],
      ),
    );
  }
}

class Btn_Enter_State extends StatefulWidget {
  _Btn_Enter_State createState() => _Btn_Enter_State();
}

class _Btn_Enter_State extends State<Btn_Enter_State> {
  int _state_btn = 0;
  bool _check_remember = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 48.0),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('Запомнить меня'),
            activeColor: Theme.of(context).primaryColor,
            value: _check_remember,
            onChanged: (bool value) {
              setState(() {
                _check_remember = value;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: ButtonTheme(
            minWidth: size.width / 1.6,
            child: MaterialButton(
              color: Theme.of(context).primaryColor,
              child: btnLogin(_state_btn, context),
              elevation: 4.0,
              onPressed: _state_btn == 0 ? submit : null,
            ),
          ),
        ),
      ],
    );
  }

  void submit() {
    String _name = StoreProvider.of<AppState>(context).state.name_db;
    String _path = StoreProvider.of<AppState>(context).state.path_db;
    String _login = StoreProvider.of<AppState>(context).state.login;
    String _pass = StoreProvider.of<AppState>(context).state.pass;
    String _token = StoreProvider.of<AppState>(context).state.token;
    String _body_str = _login + ',' + 'Android' + ',' + '1.0' + ',' + _token;

    if (_name == '' || _path == '' || _login == '' || _pass == '') {
      show_snack_error(context, 'Заполните все поля');
    } else {
      setState(() {
        _state_btn = 1;

        _incrementPrefs(_check_remember, _name, _path, _login, _pass);

        ObjRepository(
                path_DB: _path, login: _login, pass: _pass, body_str: _body_str)
            .check_connection()
            .then(_enter_or_not)
            .timeout(Duration(seconds: 12))
            .catchError((onError) => {_error_internet()});
      });
    }
  }

  void _enter_or_not(String answer) {
    if (answer == "123") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WorkActivity_Android()));
    } else {
      show_snack_error(context, 'Проверьте введенные данные');
    }

    setState(() {
      _state_btn = 0;
    });
  }

  void _error_internet() {
    setState(() {
      _state_btn = 0;
    });
    show_snack_error(context, 'Не удалось соединиться с сервером');
  }

  void show_snack_error(BuildContext context, String msg_error) {
    final snackBar = SnackBar(
      content: Text(msg_error),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Widget btnLogin(state_btn, BuildContext context) {
    if (state_btn == 0) {
      return new Text(
        "ВОЙТИ",
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      );
    } else if (state_btn == 1) {
      return CircularProgressIndicator(
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      );
    }
  }
}

_incrementPrefs(bool checkRemember, String name, String path, String login,
    String pass) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (checkRemember) {
    prefs.setString('name', name);
    prefs.setString('path', path);
    prefs.setString('login', login);
    prefs.setString('pass', pass);
    prefs.setBool("remember", checkRemember);
  } else {
    prefs.setString('name', '');
    prefs.setString('path', '');
    prefs.setString('login', '');
    prefs.setString('pass', '');
    prefs.setBool("remember", false);
  }
}
