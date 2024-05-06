import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  Future writeCache({required String key, required String value}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    bool isSaved = await pref.setString(key, value);

    print(isSaved.toString());
    print("writeCache");
  }

  Future<String?> readCache({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String? value = pref.getString(key);

    return value;
  }

  Future removeCache({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    bool isCleared = await pref.clear();

    print(isCleared.toString());
    print("removeCache");
  }
}
