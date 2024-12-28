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
        builder: (_) => CupertinoTheme(data: context!.theme, child: view),
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
    Widget view, {
    bool replace = false,
    R? pushReplacementResult,
    BuildContext? context,
    bool clearStack = false,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return navigateTo(
      view,
      replace: replace,
      pushReplacementResult: pushReplacementResult,
      context: context,
    );
  }

  Future<T?> Function() onNavigateTo<T, R>(
    Widget view, {
    bool replace = false,
    R? pushReplacementResult,
    BuildContext? context,
    bool clearStack = false,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return () => navigateTo(
          view,
          replace: replace,
          pushReplacementResult: pushReplacementResult,
          context: context,
          clearStack: clearStack,
          predicate: predicate,
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

  Future<void> showSuccessPopUp(BuildContext context, String text, {VoidCallback? action}) {
    final completer = Completer();
    Future.delayed(const Duration(milliseconds: 800), () {
      navigatorKey.currentState?.maybePop();
      action?.call();
      completer.complete();
    });
    showDialog(
      context: context,
      barrierColor: NSColors.transparent,
      barrierDismissible: false,
      builder: (context) => _SuccessAlert(text: text),
    );
    return completer.future;
  }
}

extension NSNavigationBuildContextExtension on BuildContext {
  NavigatorState get navigatorState => Navigator.of(this);
  void pop([result]) => navigatorState.maybePop(result);
}

class _SuccessAlert extends StatelessWidget {
  final String text;
  const _SuccessAlert({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: NSDecorations.borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            width: min(100 + context.width * 0.3, 200),
            height: min(100 + context.width * 0.3, 200),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: NSDecorations.borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  CupertinoColors.systemGrey6.resolveFrom(context).withOpacity(0.3),
                  CupertinoColors.systemGrey5.resolveFrom(context).withOpacity(0.8),
                ],
              ),
            ),
            padding: NSPaddings.insetGroupedPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 120,
                  color: CupertinoColors.label.resolveFrom(context).withOpacity(0.6),
                ),
                Text(
                  text,
                  style: context.textStyle.copyWith(
                    color: CupertinoColors.label.resolveFrom(context).withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
