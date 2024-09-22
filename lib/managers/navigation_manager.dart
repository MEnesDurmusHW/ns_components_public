part of ns_components;

final navigator = NavigationManager._();

final class NavigationManager {
  NavigationManager._();
  final _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  BuildContext get context => navigatorKey.currentState!.overlay!.context;

  Future<T?> navigateTo<T, R>(
    Widget view, {
    bool replace = false,
    R? pushReplacementResult,
    BuildContext? context,
    bool clearStack = false,
    bool Function(Route<dynamic>)? predicate,
  }) {
    context ??= this.context;
    final route = CupertinoPageRoute<T>(
        builder: (_) => view,
        settings: RouteSettings(
          name: view.runtimeType.toString(),
        ));
    final navigatorState = Navigator.of(context);
    return clearStack
        ? navigatorState.pushAndRemoveUntil(route, predicate ?? (_) => false)
        : replace
            ? navigatorState.pushReplacement<T?, R>(route, result: pushReplacementResult)
            : navigatorState.push<T?>(route);
  }

  Future<T?> to<T, R>(
    Widget route, {
    bool replace = false,
    R? pushReplacementResult,
    BuildContext? context,
  }) {
    return navigateTo(
      route,
      replace: replace,
      pushReplacementResult: pushReplacementResult,
      context: context,
    );
  }

  void goBack<T>([
    T? result,
    BuildContext? context,
  ]) {
    context ??= this.context;
    if (Navigator.canPop(context)) Navigator.pop(context, result);
  }

  void goBackTwice<T>([
    T? result,
    BuildContext? context,
  ]) {
    context ??= this.context;
    goBack(null, context);
    goBack(result, context);
  }

  Future<T?> showModalBottomSheet<T>({
    required Widget Function(BuildContext context) builder,
    BuildContext? context,
    bool barrierDismissible = true,
    bool semanticsDismissible = false,
  }) {
    context ??= this.context;
    return showCupertinoModalPopup(
      context: context,
      builder: builder,
      semanticsDismissible: semanticsDismissible,
      barrierDismissible: barrierDismissible,
    );
  }

  Future<bool> confirmationDialog({
    String? title,
    Widget? content,
    required String confirmText,
    String? cancelText,
    bool isConfirmDestructive = false,
    BuildContext? context,
  }) async {
    context ??= this.context;
    return (await showCupertinoDialog<bool?>(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: title != null ? Text(title) : null,
              content: content,
              actions: [
                if (cancelText != null)
                  CupertinoDialogAction(
                    isDefaultAction: isConfirmDestructive,
                    onPressed: () => goBack(false, context),
                    child: Text(cancelText),
                  ),
                CupertinoDialogAction(
                  onPressed: () => goBack(true, context),
                  isDestructiveAction: isConfirmDestructive,
                  isDefaultAction: !isConfirmDestructive,
                  child: Text(confirmText),
                ),
              ],
            );
          },
        )) ??
        false;
  }

  Future<void> simpleDialog({
    String? title,
    Widget? content,
    required String confirmText,
    BuildContext? context,
  }) async {
    context ??= this.context;
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext _context) {
        return CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: content,
          actions: [
            CupertinoDialogAction(
              onPressed: () => goBack(null, context),
              isDefaultAction: true,
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }
}

extension NSNavigationBuildContextExtension on BuildContext {
  NavigatorState get navigatorState => Navigator.of(this);
  void pop([result]) => navigatorState.maybePop(result);
}
