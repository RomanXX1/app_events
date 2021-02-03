import 'dart:io' show Platform;
import 'package:app_events/app_state/app_state.dart';
import 'package:app_events/app_state/reducer_app_state.dart';
import 'package:app_events/app_state/save_state_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'blocks/main_block/main_block.dart';
import 'main_widget.dart';
import 'server/repository.dart';

void main() {
  bool isAndroid = false;
  bool isIOS = false;

  if (Platform.isAndroid) {
    isAndroid = true;
  } else if (Platform.isIOS) {
    isIOS = true;
  }

  if (isAndroid) {
    runApp(MaterialApp(home: MasterApp(isAndroid: isAndroid, isIOS: isIOS)));
  } else if (isIOS) {
    runApp(CupertinoApp(
      home: MasterApp(
        isAndroid: isAndroid,
        isIOS: isIOS,
      ),
    ));
  }
}

class MasterApp extends StatelessWidget {
  bool isAndroid = false;
  bool isIOS = false;
  MasterApp({this.isAndroid, this.isIOS});

  final repository = ObjRepository();

  final store = Store<AppState>(appReducer,
      initialState:
          AppState(login: '', pass: '', name_db: '', path_db: '', token: ''));

  @override
  Widget build(BuildContext context) {
    String _token;
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunge: $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
      },
    );
    _firebaseMessaging.getToken().then((token) async {
      print('token: $token'); // Print the Token in Console
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
    });
    // _firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(sound: true, badge: true, alert: true));

    return BlocProvider<MainBlock>(
      create: (context) => MainBlock(
          objRepository: repository, isAndroid: isAndroid, isIOS: isIOS),
      child: StoreProvider(
        store: store,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: MainWidget(
            isAndroid: isAndroid,
            isIOS: isIOS,
          ),
        ),
      ),
    );
  }
}
