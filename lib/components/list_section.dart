part of '../ns_components.dart';

class NSListSection extends StatelessWidget {
  final List<Widget> children;
  final String? title;
  final bool bigTitle;
  final String? footerText;
  final bool hasPadding;
  const NSListSection({
    super.key,
    required this.children,
    this.title,
    this.footerText,
    this.hasPadding = true,
    this.bigTitle = false,
  });

  bool get hasTitle => title != null;
  bool get hasFooter => footerText != null;
  bool get hasLeading => NSUtils().tryGetValue(() => (children.first as dynamic).leading) != null;
  bool get isNSWidget => children.first is NSWidget;

  double get additionalDividerMargin {
    return hasLeading || isNSWidget ? 28 + (children.first is NSWidget ? (children.first as NSWidget).padding.left : 20.0) + 4.0 : 5.0;
  }

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();
    final headerFooterTextStyle = bigTitle
        ? context.textTheme.navTitleTextStyle
        : CupertinoTheme.of(context).textTheme.textStyle.merge(TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w300,
              color: CupertinoDynamicColor.resolve(NSColors.kHeaderFooterColor, context),
            ));

    return Padding(
      padding: NSPaddings.insetGroupedPadding,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          if (hasTitle)
            Padding(
              padding: EdgeInsets.only(left: bigTitle ? 0.0 : NSPaddingTypes.m, bottom: NSPaddingTypes.xs),
              child: Text(
                title!,
                style: CupertinoTheme.of(context).textTheme.textStyle.merge(headerFooterTextStyle),
              ),
            ),
          CupertinoListSection.insetGrouped(
            backgroundColor: CupertinoColors.systemGroupedBackground,
            topMargin: 0,
            margin: EdgeInsets.zero,
            additionalDividerMargin: additionalDividerMargin,
            hasLeading: hasLeading,
            children: children,
          ),
          if (hasFooter)
            Padding(
              padding: const EdgeInsets.only(left: NSPaddingTypes.m, top: NSPaddingTypes.xs),
              child: Text(
                footerText!,
                style: CupertinoTheme.of(context).textTheme.textStyle.merge(headerFooterTextStyle),
              ),
            ),
        ],
      ),
    );
  }
}
