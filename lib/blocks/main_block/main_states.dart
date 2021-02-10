abstract class MainStates {}

class data_loading_Android_State extends MainStates {}

class data_loaded_Android_State extends MainStates {
  String platform;
  String name;
  String ver;
  data_loaded_Android_State({this.platform, this.name, this.ver});
}

class LoginActivityState_Android extends MainStates {}

class WorkActivityState_Android extends MainStates {}

class ErrorActivityState_Android extends MainStates {}

class LoginActivityState_iOS extends MainStates {}

class WorkActivityState_iOS extends MainStates {}

class ErrorActivityState_iOS extends MainStates {}
