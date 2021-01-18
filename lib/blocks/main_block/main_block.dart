import 'package:app_events/activities/enter_actitvities/android/link_activity_android.dart';
import 'package:app_events/activities/enter_actitvities/ios/link_activity_ios.dart';
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
      LinkActivity_Android();
    } else if (isIOS) {
      LinkActivity_iOS();
    } else {
      ErrorActivity();
    }
  }

  @override
  Stream<MainStates> mapEventToState(MainEvent event) async* {}
}
