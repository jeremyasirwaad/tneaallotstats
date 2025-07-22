import './services/config_service.dart';

// Dynamic values that will be loaded from local storage
String get ip => ConfigService.instance.ip;
String get gip => ConfigService.instance.gip;
String get token => ConfigService.instance.token;
