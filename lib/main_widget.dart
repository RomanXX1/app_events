import 'package:app_events/activities/enter_actitvities/android/login_activity_android.dart';
import 'package:app_events/activities/enter_actitvities/android/work_activity_android.dart';
import 'package:app_events/activities/enter_actitvities/ios/login_activity_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocks/main_block/main_block.dart';
import 'blocks/main_block/main_states.dart';

class MainWidget extends StatelessWidget {
  bool isAndroid;
  bool isIOS;
  MainWidget({this.isAndroid, this.isIOS});

  @override
  Widget build(BuildContext context) {
    if (isAndroid) {
      return MainWidgetAndroid();
    } else if (isIOS) {
      return Scaffold(body: Center(child: MainWidgetIOS()));
    }
  }

  Widget MainWidgetAndroid() {
    return BlocBuilder<MainBlock, MainStates>(
      builder: (context, state) {
        if (state is LoginActivityState_Android) {
          return LoginActivity_Android();
        } else if (state is WorkActivityState_Android) {
          return WorkActivity_Android();
        }
        return LoginActivity_Android();
      },
    );
  }

  Widget MainWidgetIOS() {
    return BlocBuilder<MainBlock, MainStates>(
      builder: (context, state) {
        if (state is LoginActivityState_iOS) {
          return LoginActivity_iOS();
        } else if (state is WorkActivityState_iOS) {
          return Text('iOS');
        }
        return LoginActivity_iOS();
      },
    );
  }
}
