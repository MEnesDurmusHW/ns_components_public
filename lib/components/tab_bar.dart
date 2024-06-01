part of ns_components;

class NSTabBar extends CupertinoTabScaffold {
  NSTabBar({
    super.key,
    required List<NSBottomNavigationBarItem> items,
    required Widget Function(BuildContext, int) tabBuilder,
  }) : super(
          tabBuilder: tabBuilder,
          backgroundColor: NSColors.background,
          tabBar: CupertinoTabBar(
            items: items,
            backgroundColor: NSColors.partiallyTransparentBackground,
          ),
        );
}
