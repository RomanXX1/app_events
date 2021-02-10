import 'package:app_events/activities/enter_actitvities/android/login_activity_android.dart';
import 'package:app_events/activities/enter_actitvities/android/work_activity_android.dart';
import 'package:app_events/activities/enter_actitvities/ios/login_activity_ios.dart';
import 'package:app_events/activities/error_activity.dart';
import 'package:app_events/blocks/main_block/main_events.dart';
import 'package:app_events/blocks/main_block/main_states.dart';
import 'package:app_events/server/get_data_ver.dart';
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
    if (event is data_loading_Android_State) {
      yield data_loading_Android_State();
      try {
        final DataVer data_ver = await objRepository.get_data();
        yield data_loaded_Android_State(
            platform: data_ver.platform,
            name: data_ver.name,
            ver: data_ver.ver);
      } catch (_) {}
    }
  }
}
