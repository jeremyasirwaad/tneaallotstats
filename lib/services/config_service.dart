import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  static const String _ipKey = 'app_ip';
  static const String _gipKey = 'app_gip';
  static const String _tokenKey = 'app_token';
  
  static ConfigService? _instance;
  static ConfigService get instance => _instance ??= ConfigService._();
  
  ConfigService._();
  
  String? _ip;
  String? _gip;
  String? _token;
  
  String get ip => _ip ?? '';
  String get gip => _gip ?? '';
  String get token => _token ?? '';
  
  bool get isConfigured => _ip != null && _gip != null && _token != null && 
                           _ip!.isNotEmpty && _gip!.isNotEmpty && _token!.isNotEmpty;
  
  Future<void> loadConfig() async {
    final prefs = await SharedPreferences.getInstance();
    _ip = prefs.getString(_ipKey);
    _gip = prefs.getString(_gipKey);
    _token = prefs.getString(_tokenKey);
  }
  
  Future<void> saveConfig({
    required String ip,
    required String gip,
    required String token,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    
    await prefs.setString(_ipKey, ip);
    await prefs.setString(_gipKey, gip);
    await prefs.setString(_tokenKey, token);
    
    _ip = ip;
    _gip = gip;
    _token = token;
  }
  
  Future<void> clearConfig() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_ipKey);
    await prefs.remove(_gipKey);
    await prefs.remove(_tokenKey);
    
    _ip = null;
    _gip = null;
    _token = null;
  }
} 