part of '../ns_components.dart';

final rateApp = RateApp._();

class RateApp {
  RateApp._();
  late String appStoreIdentifier;
  late String googlePlayIdentifier;

  late RateMyApp _rateMyApp;

  void init({
    required String appStoreIdentifier,
    required String googlePlayIdentifier,
  }) {
    this.appStoreIdentifier = appStoreIdentifier;
    this.googlePlayIdentifier = googlePlayIdentifier;
    _rateMyApp = RateMyApp(
      appStoreIdentifier: appStoreIdentifier,
      googlePlayIdentifier: googlePlayIdentifier,
      minDays: 0,
      minLaunches: 0,
      remindDays: 1,
      remindLaunches: 1,
    );
  }

  void showRatePopUp() {
    _rateMyApp.showRateDialog(navigator.context);
  }

  Future<void> checkAndShowRatePopUp() async {
    await _rateMyApp.init();
    if (_rateMyApp.shouldOpenDialog) {
      showRatePopUp();
    }
  }
}
