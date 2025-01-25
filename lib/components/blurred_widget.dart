part of '../ns_components.dart';

class NSBlurredWidget extends StatelessWidget {
  final Widget child;
  const NSBlurredWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: child,
        ),
      ),
    );
  }
}
