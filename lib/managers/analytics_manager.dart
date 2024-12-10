part of '../ns_components.dart';

final analyticsManager = AnalyticsManager._();

class AnalyticsManager {
  AnalyticsManager._();
  late final FirebaseAnalytics _analytics;

  Future<void> init(FirebaseAnalytics analytics) async {
    _analytics = analytics;
    _analytics.setAnalyticsCollectionEnabled(true);
    if (kDebugMode) await _analytics.setUserProperty(name: "kDebugMode", value: kDebugMode.toString());
  }

  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    String checkedName = name.replaceAll("'", '').replaceAll(" ", "");
    _analytics.logEvent(name: checkedName, parameters: parameters);
  }
}
