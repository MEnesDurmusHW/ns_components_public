part of '../ns_components.dart';

class NSDivider extends StatelessWidget {
  final double startPadding;
  const NSDivider({super.key, this.startPadding = 0});

  @override
  Widget build(BuildContext context) {
    final dividerColor = CupertinoColors.separator.resolveFrom(context);
    final double dividerHeight = 1.0 / MediaQuery.devicePixelRatioOf(context);
    return Container(
      margin: EdgeInsetsDirectional.only(start: startPadding),
      color: dividerColor,
      height: dividerHeight,
    );
  }
}
