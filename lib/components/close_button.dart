part of '../ns_components.dart';

class NSCloseButton extends StatelessWidget {
  final VoidCallback? customOnPressed;
  const NSCloseButton({super.key, this.customOnPressed});

  CupertinoDynamicColor get iconColor => const CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.systemGrey,
        darkColor: CupertinoColors.systemGrey2,
      );
  CupertinoDynamicColor get iconFillColor =>  CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.systemGrey5,
        darkColor: CupertinoColors.systemGrey4.darkColor,
      );

  @override
  Widget build(BuildContext context) {
    return NSTapGesture(
      onTap: customOnPressed ?? navigator.goBack,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor.resolveFrom(context),
            ),
          ),
          Icon(
            CupertinoIcons.xmark_circle_fill,
            size: 32,
            color: iconFillColor.resolveFrom(context),
          ),
        ],
      ),
    );
  }
}
