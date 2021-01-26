import 'package:flutter/cupertino.dart';

class LoginActivity_iOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 96.0, left: 32.0, right: 32.0),
              child: CupertinoTextField(
                prefix: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.tags_solid,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                maxLengthEnforced: true,
                placeholder: 'Наименование подключения',
                onChanged: (value) {},
              )),
          Padding(
              padding: EdgeInsets.only(top: 16.0, left: 32.0, right: 32.0),
              child: CupertinoTextField(
                prefix: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.share_up,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                maxLengthEnforced: true,
                placeholder: 'Путь к информационной базе',
                onChanged: (value) {},
              )),
          Padding(
              padding: EdgeInsets.only(top: 16.0, left: 32.0, right: 32.0),
              child: CupertinoTextField(
                prefix: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.person_solid,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                maxLengthEnforced: true,
                placeholder: 'Логин',
                onChanged: (value) {},
              )),
          Padding(
              padding: EdgeInsets.only(top: 16.0, left: 32.0, right: 32.0),
              child: CupertinoTextField(
                prefix: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.padlock_solid,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                ),
                keyboardType: TextInputType.text,
                maxLines: 1,
                maxLengthEnforced: true,
                obscureText: true,
                placeholder: 'Пароль',
                onChanged: (value) {},
              )),
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
          child: CupertinoSwitch(
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
          child: CupertinoButton(
            // color: Theme.of(context).primaryColor,
            child: btnLogin(_state_btn, context),
            onPressed: _state_btn == 0 ? submit : null,
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
        // style: TextStyle(fontSize: 16.0, color: Colors.white),
      );
    } else if (state_btn == 1) {
      return CupertinoActivityIndicator();
    }
  }
}
