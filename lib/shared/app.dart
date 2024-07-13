part of ns_components;

class NSApp extends StatelessWidget {
  final List<Widget> views;
  final Iterable<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final NSAppViewModel Function()? viewModelBuilder;
  const NSApp({
    super.key,
    required this.views,
    required this.supportedLocales,
    required this.localizationsDelegates,
    this.viewModelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder(
      viewModelBuilder: viewModelBuilder ?? () => NSAppViewModel(),
      builder: (context, viewModel) {
        return CupertinoApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigator.navigatorKey,
          theme: CupertinoThemeData(
            brightness: viewModel.brightness,
            scaffoldBackgroundColor: NSColors.background.resolveFrom(context),
            barBackgroundColor: NSColors.partiallyTransparentBackground.resolveFrom(context),
          ),
          home: viewModel.initialized ? NSDefaultTabBarView(views) : const SizedBox.shrink(),
          locale: viewModel.locale,
          supportedLocales: supportedLocales,
          localizationsDelegates: localizationsDelegates,
        );
      },
    );
  }
}

class NSAppViewModel extends BaseViewModel {
  @override
  Set<Listenable> get listenables => {nsBrightnessNotifier, nsLocaleNotifier};
  Brightness get brightness => nsBrightnessNotifier.value;
  Locale get locale => nsLocaleNotifier.value;

  bool initialized = false;

  @mustCallSuper
  @override
  void init() async {
    await brightnessManager.init();
    nsLocaleNotifier.value = Locale(Platform.localeName.substring(0, 2));
    super.init();
  }
}
