import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future<void> savePurchaseStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasPurchased', status);
  }

  static Future<bool> getPurchaseStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasPurchased') ?? false; // По умолчанию false
  }

  static Future<void> clearPurchaseStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('hasPurchased');
  }
}
