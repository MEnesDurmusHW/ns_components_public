part of '../ns_components.dart';

class NSTextFieldTile extends StatelessWidget {
  final bool isEnabled;
  final String? title;
  final String? subtitle;
  final TextEditingController? controller;
  final Widget? suffix;
  final OverlayVisibilityMode suffixMode;
  final TextInputType? keyboardType;
  final String? placeholder;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;
  final OverlayVisibilityMode prefixMode;
  final OverlayVisibilityMode clearButtonMode;
  final int? maxLength;
  final EdgeInsetsGeometry padding;

  const NSTextFieldTile({
    Key? key,
    this.title,
    this.subtitle,
    this.controller,
    this.suffix,
    this.suffixMode = OverlayVisibilityMode.editing,
    this.keyboardType,
    this.placeholder,
    this.focusNode,
    this.inputFormatters,
    this.onSubmitted,
    this.autofocus = false,
    this.prefixMode = OverlayVisibilityMode.always,
    this.clearButtonMode = OverlayVisibilityMode.never,
    this.maxLength,
    this.isEnabled = true,
    this.padding = NSPaddings.itemInsidePadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField.borderless(
      textAlign: TextAlign.end,
      controller: controller,
      readOnly: !isEnabled,
      suffix: suffix,
      suffixMode: suffixMode,
      keyboardType: keyboardType,
      placeholder: placeholder,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      onSubmitted: onSubmitted,
      autofocus: autofocus,
      prefixMode: prefixMode,
      clearButtonMode: clearButtonMode,
      style: context.textStyle.copyWith(color: context.primaryColor),
      maxLength: maxLength,
      padding: padding,
      prefix: title != null
          ? _TextFieldPrefix(
              title!,
              subtitle,
            )
          : null,
    );
  }
}



class _TextFieldPrefix extends StatelessWidget {
  final String title;
  final String? subtitle;
  const _TextFieldPrefix(this.title, [this.subtitle]);

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (subtitle != null) {
      body = Padding(
        padding: const EdgeInsets.symmetric(vertical: NSPaddingTypes.xs),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.secondaryLabel,
            ),
          ],
        ),
      );
    } else {
      body = Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }
    return Padding(
      padding: NSPaddings.listTile.copyWith(
        left: NSPaddings.listTile.left + NSPaddingTypes.xs,
        right: 0,
      ),
      child: SizedBox(
        width: context.width * 0.21,
        child: body,
      ),
    );
  }
}
