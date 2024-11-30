part of '../ns_components.dart';

class NSListSection extends StatelessWidget {
  final List<Widget> children;
  final String? title;
  final bool? bigTitle;
  final String? footerText;
  final EdgeInsets? padding;
  final bool isScrollable;
  final Widget? emptyStateWidget;
  const NSListSection({
    super.key,
    required this.children,
    this.title,
    this.footerText,
    this.padding,
    this.bigTitle,
    this.isScrollable = false,
    this.emptyStateWidget,
  });

  bool get hasTitle => title != null;
  bool get hasFooter => footerText != null;
  bool get hasLeading => NSUtils().tryGetValue(() => (children.first as dynamic).leading) != null;
  bool get isNSWidget => children.first is NSWidget;

  double get additionalDividerMargin {
    return hasLeading
        ? 28 + (children.first is NSWidget ? (children.first as NSWidget).padding.left : 20.0) + 4.0
        : 5.0;
  }

  bool isTitleBig(BuildContext context) => bigTitle ?? DefaultBigTitle.isBigTitle(context);

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty && emptyStateWidget == null) return const SizedBox.shrink();
    final headerFooterTextStyle = isTitleBig(context)
        ? context.textTheme.navTitleTextStyle
        : context.textStyle.merge(
            TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w300,
              color: CupertinoDynamicColor.resolve(NSColors.kHeaderFooterColor, context),
            ),
          );

    return Padding(
      padding: padding ?? NSPaddings.insetGroupedPadding,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
        children: [
          if (hasTitle)
            Padding(
              padding: EdgeInsets.only(
                  left: isTitleBig(context) ? 0.0 : NSPaddingTypes.m,
                  bottom: isTitleBig(context) ? NSPaddingTypes.s : NSPaddingTypes.xs),
              child: Text(
                title!,
                style: context.textStyle.merge(headerFooterTextStyle),
              ),
            ),
          if (children.isNotEmpty)
            CupertinoListSection.insetGrouped(
              backgroundColor: CupertinoColors.systemGroupedBackground,
              topMargin: 0,
              margin: EdgeInsets.zero,
              additionalDividerMargin: additionalDividerMargin,
              hasLeading: hasLeading,
              children: children,
            ),
          if (children.isEmpty && emptyStateWidget != null)
            Padding(
              padding: const EdgeInsets.only(top: NSPaddingTypes.m),
              child: emptyStateWidget!,
            ),
          if (hasFooter)
            Padding(
              padding: const EdgeInsets.only(left: NSPaddingTypes.m, top: NSPaddingTypes.xs),
              child: Text(
                footerText!,
                style: context.textStyle.merge(headerFooterTextStyle),
              ),
            ),
        ],
      ),
    );
  }
}

class DefaultBigTitle extends InheritedWidget {
  const DefaultBigTitle({
    super.key,
    required super.child,
    this.bigTitle = true,
  });

  final bool bigTitle;

  static bool isBigTitle(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DefaultBigTitle>()?.bigTitle ?? false;
  }

  @override
  bool updateShouldNotify(DefaultBigTitle oldWidget) {
    return true;
  }
}
