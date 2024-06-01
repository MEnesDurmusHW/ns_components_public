part of '../ns_components.dart';

class NSActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const NSActionButton({super.key, required this.child, required this.onPressed});
  factory NSActionButton.close() => NSActionButton(
        onPressed: navigator.goBack,
        child: const Text('Cancel'),
      );
  factory NSActionButton.primary({required String text, required VoidCallback? onPressed}) => NSActionButton(
        onPressed: onPressed,
        child: Builder(builder: (context) {
          return DefaultTextStyle(
              style: context.textTheme.actionTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
              child: Text(text));
        }),
      );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: child,
    );
  }
}
