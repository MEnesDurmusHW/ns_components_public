import 'package:flutter/cupertino.dart';
import 'package:ns_components/ns_components.dart';

class ColorsView extends StatelessWidget {
  const ColorsView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildColors(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(NSPaddingTypes.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: NSColorType.values.map((color) {
            return Column(
              children: [
                NSButton.filled(
                  color: color.color.resolveFrom(context),
                  expanded: false,
                  text: color.name,
                  padding: const EdgeInsets.symmetric(
                    vertical: NSPaddingTypes.vertical,
                    horizontal: NSPaddingTypes.s,
                  ),
                  margin: const EdgeInsets.only(bottom: NSPaddingTypes.bottom),
                  onPressed: () {},
                ),
                NSButton.tinted(
                  color: color.color,
                  expanded: false,
                  text: color.name,
                  padding: const EdgeInsets.symmetric(
                    vertical: NSPaddingTypes.vertical,
                    horizontal: NSPaddingTypes.s,
                  ),
                  margin: const EdgeInsets.only(bottom: NSPaddingTypes.bottom),
                  onPressed: () {},
                ),
              ],
            );
          }).toList(),
        ),
      );
    }

    return NSScaffold(
      title: 'Colors',
      children: [
        Padding(
          padding: NSPaddings.insetPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColoredBox(
                color: context.scaffoldBackgroundColor.resolveFrom(context),
                child: buildColors(context),
              ),
              CupertinoTheme(
                data: context.theme.copyWith(brightness: Brightness.dark),
                child: Builder(
                  builder: (context) {
                    return ColoredBox(
                      color: context.scaffoldBackgroundColor.resolveFrom(context),
                      child: buildColors(context),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
