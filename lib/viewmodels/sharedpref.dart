import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesHelper {
  // key - value
  SharePreferencesHelper();
  static final String KEY_NAME = 'KEY NAME';
  static final String KEY_SONG = 'KEY SONG';
  static final String KEY_LINK = 'KEY LINK';
  static final String KEY_PICS = 'KEY PICS';

  static Future<SharedPreferences> get sharedpreferences =>
      SharedPreferences.getInstance();

//name
  static Future saveName(String isname) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_NAME, isname);
  }

  static Future<String> readName() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_NAME) ?? '';
  }

//song
  static Future saveSong(String issong) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_SONG, issong);
  }

  static Future<String> readSong() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_SONG) ?? '';
  }

//url
  static Future saveLink(String islink) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_LINK, islink);
  }

  static Future<String> readLink() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_LINK) ?? '';
  }

//pics
  static Future savePics(String ispics) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_PICS, ispics);
  }

  static Future<String> readPics() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_PICS) ?? '';
  }

  static Future clearALLData() async {
    final pref = await sharedpreferences;
    await Future.wait(<Future>[
      pref.setString(KEY_NAME, ''),
      pref.setString(KEY_LINK, ''),
      pref.setString(KEY_PICS, ''),
      pref.setString(KEY_SONG, ''),
    ]);
  }
}
