import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveTokenToStorage(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<void> deleteTokenFromStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
}

Future<String> getTokenFromStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Object? data = prefs.get('token');
  return data.toString();
}

Future<void> saveUserIdToStorage(String userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('UserID', userId);
}

Future<void> deleteUserIdFromStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('UserID');
}

Future<String> getUserIdFromStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Object? data = prefs.get('UserID');
  return data.toString();
}

Future<void> saveUserNameToStorage(String userName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('UserName', userName);
}

Future<void> deleteUserNameFromStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('UserName');
}

Future<String> getUserNameFromStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Object? data = prefs.get('UserName');
  return data.toString();
}

class UserPreferences {
  static const String _email = 'email';
  static const String _password = 'password';

  // E-posta bilgisini kaydetmek için
  static Future<void> setEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_email, email);
  }

  // E-posta bilgisini almak için
  static Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_email);
  }

  // Şifre bilgisini kaydetmek için
  static Future<void> setPassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_password, password);
  }

  // Şifre bilgisini almak için
  static Future<String?> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_password);
  }
}
