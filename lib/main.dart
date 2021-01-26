import 'dart:io' show Platform;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print('onMessage: $message');
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print('onLaunge: $message');
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print('onResume: $message');
    //   },
    // );
    // _firebaseMessaging.getToken().then((token) {
    //   print('token: $token'); // Print the Token in Console
    // });
    // _firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(sound: true, badge: true, alert: true));

    return BlocProvider<MainBlock>(
      create: (context) => MainBlock(
          objRepository: repository, isAndroid: isAndroid, isIOS: isIOS),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MainWidget(
          isAndroid: isAndroid,
          isIOS: isIOS,
        ),
      ),
    );
  }
}
