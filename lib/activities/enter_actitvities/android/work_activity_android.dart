import 'dart:developer';

import 'package:app_events/server/get_data_ver.dart';
import 'package:app_events/server/repository.dart';
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
  bool isLoading = true;

  // Данные для вывода
  String platform = '';
  String name = '';
  String ver = '';

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
    ObjRepository repository =
        ObjRepository(path_DB: path, login: login, pass: pass);

    repository.get_data().then((response) {
      setState(() {
        platform = response.platform;
        if (response.name == "65915") {
          name = 'Комплексная автоматизация 2';
        } else {
          name = 'Необрабатываемый тип конфигурации';
        }
        ver = response.ver;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Информация')),
      body: isLoading ? Center(child: CircularProgressIndicator()) : info(),
    );
  }

  Widget info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Вы подключились к информационной базе',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 16.0),
          child: Text(
            'Параметры подключения:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
          child: Text(
            '1С:Предприятие ' + platform,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
          child: Text(
            name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
          child: Text(
            'Релиз ' + ver,
          ),
        ),
      ],
    );
  }
}
