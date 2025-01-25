part of ns_components;

class NSNavigatorKey extends NSBaseNavigatorKey {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<T?> pushWidget<T>(Widget widget) {
    final route = CupertinoPageRoute<T>(builder: (_) => widget);
    return navigatorKey.currentState?.push(route) ?? Future.value(null);
  }

  @override
  Future<bool> goBack<T>([T? result]) {
    return navigatorKey.currentState?.maybePop(result) ?? Future.value(false);
  }
}

class NSCustomNavigatorKey extends NSBaseNavigatorKey {
  final Future<bool> Function<T>([T? result]) customGoBack;
  final Future<T?> Function<T>(Widget widget) customPushWidget;

  const NSCustomNavigatorKey({required this.customGoBack, required this.customPushWidget});

  factory NSCustomNavigatorKey.fromContext(BuildContext context) {
    return NSCustomNavigatorKey(
      customGoBack: <T>([result]) async {
        navigator.goBack(result, context);
        return true;
      },
      customPushWidget: <T>(widget) => navigator.to(widget),
    );
  }
  @override
  Future<bool> goBack<T>([T? result]) {
    return customGoBack(result);
  }

  @override
  Future<T?> pushWidget<T>(Widget widget) {
    return customPushWidget(widget);
  }
}

abstract class NSBaseNavigatorKey {
  const NSBaseNavigatorKey();
  Future<T?> pushWidget<T>(Widget widget);
  Future<bool> goBack<T>([T? result]);
}
