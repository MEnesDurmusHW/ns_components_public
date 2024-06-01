part of '../ns_components.dart';

class NSSimpleScaffold extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final bool automaticallyImplyTrailing;
  final Widget child;
  final Widget? overlay;
  final Widget? action;
  final Color? backgroundColor;
  const NSSimpleScaffold({
    super.key,
    required this.title,
    required this.child,
    this.leading,
    this.overlay,
    this.action,
    this.automaticallyImplyLeading = true,
    this.automaticallyImplyTrailing = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: [
        CupertinoNavigationBar(
          backgroundColor: backgroundColor ?? NSColors.partiallyTransparentBackground,
          leading: leading ?? (automaticallyImplyLeading ? const NSBackButton() : null),
          automaticallyImplyLeading: false,
          transitionBetweenRoutes: false,
          middle: title,
          border: null,
          trailing: action ?? (automaticallyImplyTrailing ? const NSCloseButton() : null),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: child,
          ),
        ),
      ],
    );
    if (overlay != null) {
      body = Stack(
        children: [body, overlay!],
      );
    }
    return ColoredBox(
      color: backgroundColor ?? NSColors.background.resolveFrom(context),
      child: SafeArea(
        child: body,
      ),
    );
  }
}
