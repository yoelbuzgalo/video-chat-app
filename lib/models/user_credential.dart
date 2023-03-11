//Singleton class
class UserCredential {
  static final UserCredential _instance = UserCredential._internal();
  late String _uidString;

  factory UserCredential() {
    return _instance;
  }
  UserCredential._internal();

  void setUid(String uid) {
    _uidString = uid;
  }

  String get getUid => this._uidString;
}
