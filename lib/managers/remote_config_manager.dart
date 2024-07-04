part of '../ns_components.dart';

final remoteConfigManager = RemoteConfigManager._();

class RemoteConfigManager {
  RemoteConfigManager._();
  late final FirebaseRemoteConfig _remoteConfig;

  Future<void> init(FirebaseRemoteConfig config) async {
    _remoteConfig = config;
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 8),
        minimumFetchInterval: const Duration(hours: 0),
      ),
    );
    try {
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      logger.log('Unable to fetch remote config. Cached or default values will be used');
      rethrow;
    }
  }

  String getString(String key) {
    return _remoteConfig.getString(key);
  }

  String getLocalizedText(String key) {
    return LocalizedText.fromJson(jsonDecode(getString(key))).text;
  }

  bool getBool(String key) {
    return _remoteConfig.getBool(key);
  }

  double getDouble(String key) {
    return _remoteConfig.getDouble(key);
  }
}
