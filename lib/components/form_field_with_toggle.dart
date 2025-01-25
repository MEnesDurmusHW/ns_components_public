part of '../ns_components.dart';

class NSFormFieldWithToggle extends NSStatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;
  const NSFormFieldWithToggle({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  EdgeInsets get padding => NSPaddings.listTile;

  @override
  Widget build(BuildContext context) {
    final enabled = NSDefaultEnabledWidget.maybeOf(context) ?? true;
    return NSListTile(
      title: title,
      trailing: CupertinoSwitch(
        value: value,
        onChanged: enabled ? onChanged : null,
      ),
    );
  }
}
