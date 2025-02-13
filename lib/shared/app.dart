part of ns_components;

class NSApp extends StatelessWidget {
  final Widget home;
  final Iterable<Locale>? supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final NSAppViewModel Function()? viewModelBuilder;
  const NSApp({
    super.key,
    required this.home,
    required this.supportedLocales,
    required this.localizationsDelegates,
    this.viewModelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder(
      viewModelBuilder: viewModelBuilder ?? NSAppViewModel.new,
      builder: (context, viewModel) {
        return CupertinoApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigator.navigatorKey,
          theme: nsTheme.copyWith(brightness: viewModel.brightness),
          home: viewModel.initialized ? home : const SizedBox.shrink(),
          locale: viewModel.locale,
          supportedLocales: supportedLocales ?? const <Locale>[Locale('en', 'US')],
          localizationsDelegates: localizationsDelegates,
        );
      },
    );
  }
}

class NSAppViewModel extends BaseViewModel {
  @override
  Set<Listenable> get listenables => {nsbrightnessManager, nsLocaleNotifier};
  Brightness get brightness => nsbrightnessManager.getValueByContext(context);
  Locale get locale => nsLocaleNotifier.value;

  bool initialized = true;

  @mustCallSuper
  @override
  void init() async {
    await nsbrightnessManager.init();
    super.init();
  }
}
