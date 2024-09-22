part of ns_components;

class NSGradientBackgroundWidget extends StatelessWidget {
  final Widget child;
  const NSGradientBackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.primaryColor.resolveFrom(context).withOpacity(0.3),
            context.scaffoldBackgroundColor.resolveFrom(context),
            context.scaffoldBackgroundColor.resolveFrom(context),
            context.scaffoldBackgroundColor.resolveFrom(context),
          ],
        ),
      ),
      child: CupertinoTheme(
        data: context.theme.copyWith(
          scaffoldBackgroundColor: context.scaffoldBackgroundColor.withDynamicOpacity(0.5),
          barBackgroundColor: NSColors.transparent,
        ),
        child: child,
      ),
    );
  }
}
