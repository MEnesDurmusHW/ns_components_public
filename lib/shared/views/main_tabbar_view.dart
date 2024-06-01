part of ns_components;

class NSDefaultTabBarView extends StatelessWidget {
  final List<Widget> _views;
  const NSDefaultTabBarView(this._views, {super.key});

  Widget tabBuilder(_, int i) => _views[i];

  @override
  Widget build(BuildContext context) {
    return NSTabBar(
      tabBuilder: tabBuilder,
      items: [
        NSBottomNavigationBarItem(icon: CupertinoIcons.house_fill),
        NSBottomNavigationBarItem(icon: CupertinoIcons.square_grid_2x2_fill),
        NSBottomNavigationBarItem(icon: CupertinoIcons.gear_alt_fill),
      ],
    );
  }
}
