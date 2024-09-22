part of '../ns_components.dart';

class UnfocusableWidget extends StatelessWidget {
  final Widget child;
  const UnfocusableWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          return NSTapGesture(
            onTap: Focus.of(context).unfocus,
            child: child,
          );
        },
      ),
    );
  }
}