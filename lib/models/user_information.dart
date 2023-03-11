class UserInformation {
  final String _name;
  final String _teodatZehut;

  UserInformation({required String nameInput, required String teodatZehutInput})
      : _name = _validateName(nameInput),
        _teodatZehut = _validateTeodatZehut(teodatZehutInput);

  static String _validateName(String nameInput) {
    if (nameInput.isEmpty) {
      throw UserInformationException('Name cannot be empty');
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(nameInput)) {
      throw UserInformationException('Your name must be only alphabetic.');
    }
    return nameInput;
  }

  static String _validateTeodatZehut(String teodatZehutInput) {
    if (teodatZehutInput.isEmpty || teodatZehutInput.length != 9) {
      throw UserInformationException('Teodat Zehut must be 9 digits long');
    }
    if (!RegExp(r'^\d{9}$').hasMatch(teodatZehutInput)) {
      throw UserInformationException('Teodat Zehut must be numbers only');
    }
    return teodatZehutInput;
  }

  String get name => _name;
  String get teodatZehut => _teodatZehut;
}

class UserInformationException implements Exception {
  final String _message;
  UserInformationException(this._message);
  String get message => this._message;
}
