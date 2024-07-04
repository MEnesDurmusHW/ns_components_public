part of '../ns_components.dart';

class NSFilledIcon extends StatelessWidget {
  final Widget child;
  final Color? color;

  const NSFilledIcon({required this.child, super.key, this.color});

  factory NSFilledIcon.byIcon(IconData iconData, {Color? color}) {
    return NSFilledIcon(
      color: color,
      child: Icon(
        iconData,
        color: CupertinoColors.white,
        size: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: color ?? CupertinoTheme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: child),
    );
  }
}
