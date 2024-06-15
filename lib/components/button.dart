part of '../ns_components.dart';

class NSButton extends StatefulWidget {
  final String text;
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool expanded;
  final Icon? icon;
  final VoidCallback? onPressed;
  final double? minSize;
  final _NSButtonTypes _buttonType;

  const NSButton.plain({
    super.key,
    required this.text,
    this.color,
    required this.onPressed,
    this.padding,
    this.icon,
    this.expanded = false,
    this.minSize,
    this.margin,
  }) : _buttonType = _NSButtonTypes.plain;

  const NSButton.filled({
    super.key,
    required this.text,
    this.color,
    required this.onPressed,
    this.padding,
    this.icon,
    this.expanded = true,
    this.minSize,
    this.margin,
  }) : _buttonType = _NSButtonTypes.filled;

  const NSButton.tinted({
    super.key,
    required this.text,
    this.color,
    required this.onPressed,
    this.padding,
    this.icon,
    this.expanded = false,
    this.minSize,
    this.margin,
  }) : _buttonType = _NSButtonTypes.tinted;

  @override
  State<NSButton> createState() => _NSButtonState();
}

class _NSButtonState extends State<NSButton> with SingleItemSingleTimeMeasureSizeStateMixin {
  TextStyle getTextStyle(BuildContext context) {
    final foregroundColor = getForegroundColor(context);
    final textStyle = DefaultTextStyle.of(context).style.copyWith(color: foregroundColor);
    switch (widget._buttonType) {
      case _NSButtonTypes.filled:
        return textStyle.copyWith(fontWeight: FontWeight.w600, color: textColor ?? CupertinoColors.white);
      case _NSButtonTypes.plain:
        return textStyle.copyWith(color: foregroundColor);
      case _NSButtonTypes.tinted:
        return textStyle.copyWith(fontWeight: FontWeight.w500, color: widget.color);
    }
  }

  Color? getForegroundColor(BuildContext context) {
    final Color primaryColor = context.theme.primaryColor;
    if (widget._buttonType == _NSButtonTypes.plain) {
      if (enabled) {
        return widget.color ?? primaryColor;
      } else {
        return CupertinoColors.placeholderText.resolveFrom(context);
      }
    }
    final Color? backgroundColor = widget.color == null
        ? (widget._buttonType == _NSButtonTypes.filled ? primaryColor : null)
        : CupertinoDynamicColor.maybeResolve(widget.color, context);
    return backgroundColor != null
        ? context.theme.primaryContrastingColor
        : enabled
            ? primaryColor
            : CupertinoDynamicColor.resolve(CupertinoColors.placeholderText, context);
  }

  Color? getFillColor(BuildContext context) {
    switch (widget._buttonType) {
      case _NSButtonTypes.filled:
        return widget.color ?? context.theme.primaryColor;
      case _NSButtonTypes.plain:
        return null;
      case _NSButtonTypes.tinted:
        return (widget.color ?? context.theme.primaryColor).withOpacity(0.16);
    }
  }

  bool get enabled => widget.onPressed != null;

  Color? get textColor => widget.color == null
      ? null
      : widget.color!.computeLuminance() > 0.5
          ? widget.color!.value == CupertinoColors.white.value
              ? null
              : CupertinoColors.black
          : CupertinoColors.white;

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      widget.text,
      style: getTextStyle(context),
    );

    if (widget.icon != null) {
      child = Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: NSPaddingTypes.xs),
            child: IconTheme(data: IconTheme.of(context).copyWith(color: getForegroundColor(context)), child: widget.icon!),
          ),
          child,
        ],
      );
    }

    return SizedBox(
      width: widget.expanded ? double.infinity : null,
      child: Padding(
        padding: widget.margin ?? NSPaddings.insetGroupedPadding,
        child: MeasureSize(
          onChange: onChange,
          child: CupertinoButton(
            minSize: widget.minSize ?? kMinInteractiveDimensionCupertino,
            padding: widget.padding,
            borderRadius: NSDecorations.getBorderRadiusBySize(size?.height),
            color: getFillColor(context),
            onPressed: widget.onPressed,
            child: child,
          ),
        ),
      ),
    );
  }
}

enum _NSButtonTypes {
  plain,
  filled,
  tinted,
}
