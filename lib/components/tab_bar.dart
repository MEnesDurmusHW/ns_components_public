part of ns_components;

class NSTabBar extends CupertinoTabScaffold {
  NSTabBar({
    super.key,
    required List<NSBottomNavigationBarItem> items,
    required Widget Function(BuildContext, int) tabBuilder,
  }) : super(
          tabBuilder: tabBuilder,
          tabBar: CupertinoTabBar(items: items),
        );
}

// class NSTabBar extends StatelessWidget {
//   final List<NSBottomNavigationBarItem> items;
//   final Widget Function(BuildContext, int) tabBuilder;
//   const NSTabBar({super.key, required this.items, required this.tabBuilder});

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBuilder: tabBuilder,
//       tabBar: CupertinoTabBar(items: items),
//     );
//   }
// }
