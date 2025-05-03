
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  // Store tokens in SharedPreferences
  static Future<void> storeTokens(String access, String refresh) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessToken, access);
    await prefs.setString(refreshToken, refresh);
  }

  // Get access token from SharedPreferences
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessToken);
  }

  // Get refresh token from SharedPreferences
  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(refreshToken
    );
  }

  // Clear tokens when logging out
  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(accessToken);
    await prefs.remove(refreshToken
    );
  }
}
