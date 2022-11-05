import 'package:nextparty/Models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  SharedPreferences? _preferences;
  User user = User(name: '', lastname: '', email: '', password: '', phone: '');
  String token = '';
  Future<SharedPreferences?> get preferences async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
      token = _preferences!.getString('token') ?? '';
      user = User(
        name: _preferences!.getString('name') ?? '',
        lastname: _preferences!.getString('lastname') ?? '',
        email: _preferences!.getString('email') ?? '',
        password: _preferences!.getString('password') ?? '',
        phone: _preferences!.getString('phone') ?? '',
      );
    }
    return _preferences;
  }

  Future<Preferences> init() async {
    _preferences = await preferences;
    return this;
  }

  Future<void> saveToken(String _token) async {
    await _preferences!.setString('token', _token);
    token = _token;
  }

  Future<String> getToken() async {
    token = _preferences!.getString('token') ?? '';
    return token;
  }

  Future<void> saveUser(User _user) async {
    await _preferences!.setInt('id', _user.id!);
    await _preferences!.setString('name', _user.name);
    await _preferences!.setString('lastname', _user.lastname);
    await _preferences!.setString('email', _user.email);
    await _preferences!.setString('phone', _user.phone ?? "");
    await _preferences!.setString('birthday', _user.birthday.toString());
    user = _user;
  }

  Future<User> getUser() async {
    user = User(
      id: _preferences!.getInt('id'),
      name: _preferences!.getString('name') ?? '',
      lastname: _preferences!.getString('lastname') ?? '',
      email: _preferences!.getString('email') ?? '',
      password: _preferences!.getString('password') ?? '',
      phone: _preferences!.getString('phone') ?? '',
      birthday: DateTime.parse(_preferences!.getString('birthday') ?? ''),
    );
    return user;
  }

  Future<int?> getId() async {
    return _preferences!.getInt('id');
  }

  Future<void> deleteSession() async {
    await _preferences!.clear();
  }
}
