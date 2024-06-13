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
  }) : assert(suffix == null || actionSuffix == null);

  bool get isNumeric => [TextInputType.number].contains(keyboardType);

  @override
  Widget build(BuildContext context) {
    final isEnabled = enabled ?? NSDefaultEnabledWidget.maybeOf(context)?.isEnabled ?? true;
    return AbsorbPointer(
      absorbing: !isEnabled,
      child: CupertinoTextField.borderless(
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
