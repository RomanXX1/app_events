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
      return Scaffold(
        body: Center(child: MainWidgetAndroid()),
      );
    } else if (isIOS) {
      return Scaffold(body: Center(child: MainWidgetIOS()));
    }
  }

  Widget MainWidgetAndroid() {
    return BlocBuilder<MainBlock, MainStates>(
      builder: (context, state) {
        // if (state is MainWindowShowState) {
        //   return MainWindowShow_Android();
        // }
        return Text('Android');
      },
    );
  }

  Widget MainWidgetIOS() {
    return BlocBuilder<MainBlock, MainStates>(
      builder: (context, state) {
        return Text('iOS');
      },
    );
  }
}
