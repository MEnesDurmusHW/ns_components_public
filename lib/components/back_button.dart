part of '../ns_components.dart';

class NSBackButton extends StatelessWidget {
  const NSBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigator.goBack,
      child: Icon(
        CupertinoIcons.arrow_left,
        color: NSColors.actionColor.resolveFrom(context),
        size: 26,
      ),
    );
  }
}
