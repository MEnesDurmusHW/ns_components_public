part of '../ns_components.dart';

class NSTextField extends StatelessWidget {
  final String? placeholder;
  final Widget? suffix;
  final OverlayVisibilityMode suffixMode;
  final Widget? actionSuffix;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? enabled;
  final FocusNode? focusNode;
  final bool autofocus;

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
  }) : assert(suffix == null || actionSuffix == null);

  bool get isNumeric => [TextInputType.number].contains(keyboardType);

  @override
  Widget build(BuildContext context) {
    final isEnabled = enabled ?? NSDefaultEnabledWidget.maybeOf(context)?.isEnabled ?? true;
    return AbsorbPointer(
      absorbing: !isEnabled,
      child: CupertinoTextField.borderless(
        focusNode: focusNode,
        autofocus: autofocus,
        placeholder: placeholder,
        suffix: suffix ?? (isEnabled ? actionSuffix : null),
        controller: controller,
        maxLength: maxLength,
        suffixMode: suffixMode,
        padding: const EdgeInsets.symmetric(vertical: NSPaddingTypes.s, horizontal: NSPaddingTypes.m),
        inputFormatters: [if (isNumeric) FilteringTextInputFormatter.digitsOnly],
        keyboardType: keyboardType,
      ),
    );
  }
}
