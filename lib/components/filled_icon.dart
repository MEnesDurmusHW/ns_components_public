part of '../ns_components.dart';

class NSFilledIcon extends StatelessWidget {
  final IconData iconData;
  final Color? color;

  const NSFilledIcon(this.iconData, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: color ?? CupertinoTheme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(
          iconData,
          color: CupertinoColors.white,
          size: 20,
        ),
      ),
    );
  }
}
