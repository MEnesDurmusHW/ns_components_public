part of ns_components;

class NSListTile extends NSStatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final Widget? additionalInfo;
  final VoidCallback? onTap;
  final EdgeInsets? customPadding;
  const NSListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.leading,
    this.additionalInfo,
    this.onTap,
    this.customPadding,
  });

  factory NSListTile.navigationLink({
    Key? key,
    required String title,
    VoidCallback? onTap,
    Widget? leading,
    Widget? additionalInfo,
  }) {
    return NSListTile(
      title: title,
      onTap: onTap,
      trailing: onTap != null
          ? Builder(builder: (context) {
              return Icon(
                CupertinoIcons.chevron_forward,
                size: CupertinoTheme.of(context).textTheme.textStyle.fontSize,
                color: CupertinoColors.systemGrey2.resolveFrom(context),
              );
            })
          : null,
      additionalInfo: additionalInfo,
      leading: leading,
    );
  }

  EdgeInsets get _padding => customPadding ?? NSPaddings.listTile;

  @override
  EdgeInsets get padding => _padding;

  bool get hasLeading => leading != null;

  Widget getTitleWidget(String title) {
    return hasLeading
        ? Text(title)
        : Padding(
            padding: const EdgeInsets.only(left: NSPaddingTypes.xs),
            child: Text(title),
          );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: getTitleWidget(title),
      subtitle: subtitle != null ? getTitleWidget(subtitle!) : null,
      leading: leading,
      trailing: trailing,
      additionalInfo: additionalInfo,
      onTap: onTap,
      padding: _padding,
    );
  }
}
