import 'package:flutter/material.dart';

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
  String pwd = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 64.0, left: 32.0, right: 32.0),
            child: TextFormField(
              onChanged: (value) {},
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
              onChanged: (value) {},
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
              onChanged: (value) {},
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Имя пользователя",
                icon: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Icon(
                    Icons.login,
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
              onChanged: (value) {},
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
                text: path,
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
    setState(() {
      _state_btn = 1;
      Future.delayed(const Duration(milliseconds: 5000), () {
        setState(() {
          _state_btn = 0;
        });
      });
    });
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
