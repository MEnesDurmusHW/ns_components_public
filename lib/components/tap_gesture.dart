part of '../ns_components.dart';

class NSTapGesture extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  const NSTapGesture({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
