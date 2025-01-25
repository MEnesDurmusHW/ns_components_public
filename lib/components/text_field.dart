part of '../ns_components.dart';

class NSTextField extends StatelessWidget {
  final String? placeholder;
  final Widget? suffix;
  final OverlayVisibilityMode suffixMode;
  final Widget? prefix;
  final OverlayVisibilityMode prefixMode;
  final Widget? actionSuffix;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? enabled;
  final FocusNode? focusNode;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry padding;
  final OverlayVisibilityMode clearButtonMode;

  const NSTextField({
    super.key,
    this.placeholder,
    this.suffix,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.enabled,
    this.actionSuffix,
    this.suffixMode = OverlayVisibilityMode.always,
    this.focusNode,
    this.autofocus = false,
    this.inputFormatters,
    this.prefix,
    this.prefixMode = OverlayVisibilityMode.always,
    this.clearButtonMode = OverlayVisibilityMode.never,
    this.padding = NSPaddings.itemInsidePadding,
  }) : assert(suffix == null || actionSuffix == null);

  bool get isNumeric => [TextInputType.number.index].contains(keyboardType?.index);

  @override
  Widget build(BuildContext context) {
    final isEnabled = enabled ?? NSDefaultEnabledWidget.maybeOf(context) ?? true;
    return CupertinoTextField.borderless(
      readOnly: !isEnabled,
      focusNode: focusNode,
      autofocus: autofocus,
      placeholder: placeholder,
      suffix: suffix ?? (isEnabled ? actionSuffix : null),
      controller: controller,
      maxLength: maxLength,
      suffixMode: suffixMode,
      prefix: prefix,
      prefixMode: prefixMode,
      clearButtonMode: clearButtonMode,
      padding: padding,
      inputFormatters: {
        if (isNumeric) FilteringTextInputFormatter.digitsOnly,
        if (inputFormatters != null) ...inputFormatters!,
      }.toList(),
      keyboardType: keyboardType,
    );
  }
}
