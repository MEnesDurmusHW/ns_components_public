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
    String? subtitle,
    VoidCallback? onTap,
    Widget? leading,
    Widget? trailing,
    Widget? additionalInfo,
    EdgeInsets? customPadding,
  }) {
    return NSListTile(
      title: title,
      subtitle: subtitle,
      customPadding: customPadding,
      onTap: onTap,
      trailing: trailing ??
          (onTap != null ? Builder(builder: (_) => const CupertinoListTileChevron()) : null),
      additionalInfo: additionalInfo,
      leading: leading,
    );
  }

  EdgeInsets get _padding => customPadding ?? NSPaddings.listTile;

  @override
  EdgeInsets get padding => _padding;

  bool get hasLeading => leading != null;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading: leading,
      trailing: trailing,
      additionalInfo: additionalInfo,
      onTap: onTap,
      padding: _padding,
    );
  }
}
