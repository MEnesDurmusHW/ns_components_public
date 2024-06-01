part of ns_components;

class NSBottomNavigationBarItem extends BottomNavigationBarItem {
  @override
  NSBottomNavigationBarItem({
    required IconData icon,
    super.label,
    EdgeInsets padding = EdgeInsets.zero,
  }) : super(
          icon: Padding(
            padding: padding,
            child: Icon(icon),
          ),
        );
}
