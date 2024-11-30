import 'package:example/widget_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:ns_components/ns_components.dart';

class ComponentsView extends StatelessWidget {
  const ComponentsView({super.key});

  VoidCallback onTap(
    String title,
    Widget widget, [
    int? codeLine,
    String? code,
  ]) {
    return () => navigator.to(WidgetDetailView(
          title: title,
          widget: widget,
          code: code,
          codeLine: codeLine,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBigTitle(
      child: NSScaffold(
        title: 'Catalog App',
        children: [
          const NSListSection(
            title: "TabBar",
            children: [
              NSListTile(title: 'NSTabBar'),
              NSListTile(title: 'NSBottomNavigationBarItem'),
            ],
          ),
          const NSListSection(
            title: "Scaffolds",
            children: [
              NSListTile(title: 'NSScaffold'),
              NSListTile(title: 'NSSimpleScaffold'),
              NSListTile(title: 'NSModalScaffold'),
            ],
          ),
          NSListSection(
            title: "Buttons",
            children: [
              NSListTile.navigationLink(
                title: 'NSButton',
                subtitle: 'filled, tinted, plain',
                onTap: onTap(
                    'NSButton',
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NSButton.filled(
                          text: 'Filled',
                          onPressed: () {},
                        ),
                        NSButton.tinted(
                          text: 'Tinted',
                          onPressed: () {},
                        ),
                        NSButton.plain(
                          text: 'Plain',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    12,
                    r'''
NSButton.filled(
  text: 'Filled',
  onPressed: () {},
),
NSButton.tinted(
  text: 'Tinted',
  onPressed: () {},
),
NSButton.plain(
  text: 'Plain',
  onPressed: () {},
),
'''),
              ),
              const NSListTile(title: 'NSBackButton'),
              NSListTile.navigationLink(
                title: 'NSAddButton',
                onTap: onTap(
                    'NSAddButton',
                    NSAddButton(
                      onTap: () {},
                    ),
                    3,
                    r'''
NSAddButton(
  onTap: () {},
)
                            '''),
              ),
              NSListTile.navigationLink(
                title: 'NSCloseButton',
                onTap: onTap(
                  'NSCloseButton',
                  NSCloseButton(
                    customOnPressed: () {},
                  ),
                ),
              ),
              const NSListTile(title: 'NSActionButton', subtitle: 'default, close, primary'),
              const NSListTile(title: 'NSLinkButton'),
              const NSListTile(title: 'NSCloseButtonInBox'),
            ],
          ),
          const NSListSection(
            title: "Tools",
            children: [
              NSListTile(title: 'NSTapGesture'),
              NSListTile(title: 'UnfocusableWidget'),
              NSListTile(title: 'MeasureSize'),
              NSListTile(title: 'NSDefaultEnabledWidget'),
            ],
          ),
          const NSListSection(
            title: "Base Class",
            children: [
              NSListTile(title: 'NSWidget'),
              NSListTile(title: 'NSStatelessWidget'),
            ],
          ),
          NSListSection(
            children: [
              NSListTile.navigationLink(title: 'NSDivider'),
              NSListTile.navigationLink(title: 'NSListTile', subtitle: 'default, navigationLink'),
              NSListTile.navigationLink(title: 'NSListSection'),
              NSListTile.navigationLink(title: 'NSOptionTile'),
              NSListTile.navigationLink(title: 'NSFilledIcon', subtitle: 'default, byIcon'),
              NSListTile.navigationLink(title: 'NSTextField'),
              NSListTile.navigationLink(title: 'NSRingChart'),
              NSListTile.navigationLink(title: 'NSEmptyStateWidget'),
              NSListTile.navigationLink(title: 'NSDisposableSection'),
              NSListTile.navigationLink(title: 'NSDisposableWidget'),
              NSListTile.navigationLink(title: 'NSPreviewSection', subtitle: 'default, inSection'),
              NSListTile.navigationLink(title: 'NSPickerPage'),
              NSListTile.navigationLink(title: 'NSImage'),
              NSListTile.navigationLink(title: 'NSOnBoarding'),
              NSListTile.navigationLink(title: 'NSGradientBackgroundWidget'),
              NSListTile.navigationLink(title: 'IntTextFieldSuffix'),
              NSListTile.navigationLink(title: 'NSCheckMark'),
              NSListTile.navigationLink(title: 'NSHeadLineInBox'),
            ],
          ),
        ],
      ),
    );
  }
}
