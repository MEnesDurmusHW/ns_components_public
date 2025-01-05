part of '../ns_components.dart';

class NSSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final Axis axis;
  final double spacing;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  const NSSection({
    super.key,
    this.title,
    required this.children,
    this.padding = NSPaddings.insetGroupedPadding,
    this.axis = Axis.vertical,
    this.spacing = NSPaddingTypes.s,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final spacedChildren = spacing == 0.0
        ? children
        : children
            .mapIndexed((index, widget) => Padding(
                  padding: EdgeInsets.only(bottom: children.length - 1 == index ? 0.0 : spacing),
                  child: children[index],
                ))
            .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: NSPaddings.headLinePadding,
            child: Text(
              title!,
              style: context.textStyle.merge(context.textTheme.navTitleTextStyle),
            ),
          ),
        Padding(
          padding: padding.copyWith(top: title != null ? 0.0 : padding.top),
          child: Flex(
            direction: axis,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: spacedChildren,
          ),
        ),
      ],
    );
  }
}
