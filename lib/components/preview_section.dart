part of '../ns_components.dart';

class NSPreviewSection extends StatelessWidget {
  final String title;
  final List<Color>? titleColors;
  final Widget? trailing;
  final Widget child;
  const NSPreviewSection({
    super.key,
    required this.title,
    this.titleColors,
    this.trailing,
    required this.child,
  });

  static Widget inSection({
    required String title,
    List<Color>? titleColors,
    Widget? trailing,
    required Widget child,
  }) {
    return NSListSection(
      children: [
        NSPreviewSection(
          titleColors: titleColors,
          title: title,
          trailing: trailing,
          child: child,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            NSPaddingTypes.s,
            NSPaddingTypes.s,
            0.0,
            NSPaddingTypes.s,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NSHeadLineInBox(
                title,
                colors: titleColors,
              ),
              if (trailing != null) ...[
                const Spacer(),
                trailing!,
              ],
            ],
          ),
        ),
        const NSDivider(),
        Padding(
          padding: const EdgeInsets.all(NSPaddingTypes.s),
          child: child,
        ),
      ],
    );
  }
}
