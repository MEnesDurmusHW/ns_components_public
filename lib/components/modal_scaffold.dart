part of '../ns_components.dart';

class ModalScaffold extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final Widget body;
  final NSNavigatorKey? navigatorKey;
  const ModalScaffold({
    super.key,
    required this.title,
    required this.body,
    this.leading,
    this.trailing,
    this.navigatorKey,
  });

  factory ModalScaffold.withCloseButton({
    Key? key,
    required String title,
    required Widget body,
  }) {
    return ModalScaffold(
      key: key,
      title: title,
      trailing: const NSCloseButton(),
      body: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    final nsScaffold = NSSimpleScaffold(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: NSPaddingTypes.s),
        child: Text(title),
      ),
      automaticallyImplyLeading: false,
      leading: leading,
      action: trailing,
      backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(context),
      child: body,
    );
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(top: NSPaddingTypes.s),
        child: ClipRRect(
          borderRadius: NSDecorations.borderRadius,
          child: navigatorKey == null
              ? nsScaffold
              : Navigator(
                  key: navigatorKey!.navigatorKey,
                  initialRoute: Navigator.defaultRouteName,
                  onGenerateInitialRoutes: (_, __) => [
                    CupertinoPageRoute(builder: (_) => nsScaffold),
                  ],
                ),
        ),
      ),
    );
  }
}

class NSNavigatorKey {
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> pushWidget<T>(Widget widget) {
    final route = CupertinoPageRoute<T>(builder: (_) => widget);
    return navigatorKey.currentState?.push(route) ?? Future.value(null);
  }

  Future<bool> goBack<T>([T? result]) {
    return navigatorKey.currentState?.maybePop(result) ?? Future.value(false);
  }
}
