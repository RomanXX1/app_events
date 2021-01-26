import 'package:app_events/activities/enter_actitvities/android/login_activity_android.dart';
import 'package:app_events/activities/enter_actitvities/android/work_activity_android.dart';
import 'package:app_events/activities/enter_actitvities/ios/login_activity_ios.dart';
import 'package:app_events/activities/error_activity.dart';
import 'package:app_events/blocks/main_block/main_events.dart';
import 'package:app_events/blocks/main_block/main_states.dart';
import 'package:app_events/server/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBlock extends Bloc<MainEvent, MainStates> {
  final ObjRepository objRepository;
  bool isAndroid = false;
  bool isIOS = false;
  MainBlock({this.objRepository, this.isAndroid, this.isIOS})
      : assert(objRepository != null);

  @override
  MainStates get initialState {
    if (isAndroid) {
      LoginActivity_Android();
    } else if (isIOS) {
      LoginActivity_iOS();
    } else {
      ErrorActivity();
    }
  }

  @override
  Stream<MainStates> mapEventToState(MainEvent event) async* {
    if (event is LoginActivityEvent_Android) {
      yield LoginActivityState_Android();
    } else if (state is WorkActivityEvent_Android) {
      yield WorkActivityState_Android();
    } else if (event is LoginActivityEvent_iOS) {
      yield LoginActivityState_iOS();
    } else if (event is WorkActivityEvent_iOS) {
      yield WorkActivityState_iOS();
    }
  }
}
