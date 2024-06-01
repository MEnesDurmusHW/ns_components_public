part of '../ns_components.dart';

class NSEmptyStateWidget extends StatelessWidget {
  final Widget? icon;
  final String text;
  final Widget? bottomWidget;
  const NSEmptyStateWidget({super.key, this.icon, required this.text, this.bottomWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: NSPaddings.insetPadding,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: NSPaddingTypes.s),
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        CupertinoColors.systemGrey,
                        BlendMode.srcATop,
                      ),
                      child: icon,
                    ),
                  ),
                Text(
                  text,
                  style: NSTextStyles.disableText,
                )
              ],
            ),
            if (bottomWidget != null) bottomWidget!,
          ],
        ),
      ),
    );
  }
}
