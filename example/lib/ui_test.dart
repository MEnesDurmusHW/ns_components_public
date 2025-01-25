import 'package:example/subviews/button_colors_view.dart';
import 'package:example/subviews/form_fields_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:ns_components/ns_components.dart';

class UITest extends StatelessWidget {
  const UITest({super.key});

  @override
  Widget build(BuildContext context) {
    return NSScaffold(
      title: 'UI Test',
      children: [
        NSListSection(children: [
          NSListTile.navigationLink(
            title: 'Button Colors',
            onTap: navigator.onNavigateTo(const ButtonColorsView()),
          ),
          NSListTile.navigationLink(
            title: 'Form Fields',
            onTap: navigator.onNavigateTo(const FormFieldsView()),
          ),
        ]),
        ColoredBox(
          color: context.scaffoldBackgroundColor.resolveFrom(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoColors.systemBlue.resolveFrom(context),
              CupertinoColors.systemBlue.resolvedTintedColor(context),
              CupertinoColors.systemBlue.resolveFrom(context).withOpacity(0.16),
            ].map((color) {
              return ColoredBox(
                color: color,
                child: const Padding(
                  padding: NSPaddings.itemInsidePadding,
                  child: Text('systemBlue'),
                ),
              );
            }).toList(),
          ),
        ),
        CupertinoTheme(
          data: context.theme.copyWith(brightness: Brightness.dark),
          child: Builder(builder: (context) {
            return ColoredBox(
              color: context.scaffoldBackgroundColor.resolveFrom(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoColors.systemBlue.resolveFrom(context),
                  CupertinoColors.systemBlue.resolvedTintedColor(context),
                  CupertinoColors.systemBlue.resolveFrom(context).withOpacity(0.16),
                ].map((color) {
                  return ColoredBox(
                    color: color,
                    child: const Padding(
                      padding: NSPaddings.itemInsidePadding,
                      child: Text('systemBlue'),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ),
        const NSListSection(
          children: [
            NSListTile(title: 'systemBlue'),
            NSListTile(title: 'systemBlue'),
          ],
        ),
      ],
    );
  }
}
