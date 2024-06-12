part of ns_components;

class NSPickerPage<T> extends StatelessWidget {
  final String title;
  final NSNavigatorKey navigatorKey;
  final List<T> list;
  final Widget Function(T e, NSNavigatorKey navigatorKey) optionBuilder;
  const NSPickerPage({
    super.key,
    required this.title,
    required this.navigatorKey,
    required this.list,
    this.optionBuilder = _defaultOptionBuilder,
  });

  static Widget Function(T e, NSNavigatorKey navigatorKey) defaultOptionBuilder<T>(
          {String Function(T e)? mapper, void Function(T result)? onChoose}) =>
      (e, navigatorKey) => CupertinoListTile(
            title: Text(mapper != null ? mapper(e) : e.toString()),
            onTap: () => (onChoose ?? navigatorKey.goBack).call(e),
          );

  static Widget _defaultOptionBuilder(e, navigatorKey) => CupertinoListTile(
        title: Text(e.toString()),
        onTap: () => navigatorKey.goBack(e),
      );

  @override
  Widget build(BuildContext context) {
    return NSSimpleScaffold(
      title: Text(title),
      leading: NSTapGesture(
        onTap: navigatorKey.goBack,
        child: Icon(
          CupertinoIcons.arrow_left,
          color: NSColors.actionColor.resolveFrom(context),
          size: 26,
        ),
      ),
      child: NSListSection(
        isScrollable: true,
        children: list.map((e) => optionBuilder(e, navigatorKey)).toList(),
      ),
    );
  }
}

class NSPickerListTile<T> extends NSListTile {
  final Widget Function(T e, NSNavigatorKey navigatorKey) optionBuilder;
  final NSNavigatorKey navigatorKey;
  final List<T> list;
  final String pickerTitle;
  const NSPickerListTile({
    super.key,
    required this.list,
    required this.pickerTitle,
    required super.title,
    required this.navigatorKey,
    this.optionBuilder = NSPickerPage._defaultOptionBuilder,
    super.subtitle,
    super.trailing,
    super.leading,
    super.additionalInfo,
    super.onTap,
    super.customPadding,
  });

  @override
  Widget build(BuildContext context) {
    return NSListTile(
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      leading: leading,
      additionalInfo: additionalInfo,
      onTap: () => navigatorKey.pushWidget(NSPickerPage(
        title: pickerTitle,
        navigatorKey: navigatorKey,
        list: list,
        optionBuilder: optionBuilder,
      )),
      customPadding: customPadding,
    );
  }
}
