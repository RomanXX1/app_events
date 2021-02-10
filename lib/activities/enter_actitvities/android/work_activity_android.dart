import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkActivity_Android extends StatefulWidget {
  @override
  _WorkActivity_AndroidState createState() => _WorkActivity_AndroidState();
}

class _WorkActivity_AndroidState extends State<WorkActivity_Android> {
  String path = '';
  String login = '';
  String pass = '';

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  _loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    path = prefs.getString('path') ?? '';
    login = prefs.getString('login') ?? '';
    pass = prefs.getString('pass') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Информация')),
      body: Column(
        children: [
          Text(path),
          Text(login),
          Text(pass),
        ],
      ),
    );
  }
}
