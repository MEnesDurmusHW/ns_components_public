part of ns_components;

class NSPickerPage<T> extends StatelessWidget {
  final String title;
  final OnChooseCallback goBackWithResult;
  final List<T> list;
  final Widget Function(T e, OnChooseCallback goBackWithResult) optionBuilder;
  const NSPickerPage({
    super.key,
    required this.title,
    required this.goBackWithResult,
    required this.list,
    this.optionBuilder = _defaultOptionBuilder,
  });

  static Widget Function(T e, OnChooseCallback goBackWithResult) defaultOptionBuilder<T>(
          {String Function(T e)? mapper, void Function(T result)? onChooseCallback}) =>
      (e, goBackWithResult) => CupertinoListTile(
            title: Text(mapper != null ? mapper(e) : e.toString()),
            onTap: () {
              onChooseCallback?.call(e);
              goBackWithResult(e);
            },
          );

  static Widget _defaultOptionBuilder(e, OnChooseCallback goBackWithResult) => CupertinoListTile(
        title: Text(e.toString()),
        onTap: () => goBackWithResult(e),
      );

  @override
  Widget build(BuildContext context) {
    return NSSimpleScaffold(
      title: Text(title),
      leading: NSTapGesture(
        onTap: goBackWithResult,
        child: Icon(
          CupertinoIcons.arrow_left,
          color: NSColors.actionColor.resolveFrom(context),
          size: 26,
        ),
      ),
      child: NSListSection(
        isScrollable: true,
        children: list.map((e) => optionBuilder(e, goBackWithResult)).toList(),
      ),
    );
  }
}

class NSPickerListTile<T> extends NSListTile {
  final Widget Function(T e, OnChooseCallback goBackWithResult) optionBuilder;
  final NSBaseNavigatorKey? navigatorKey;
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
    final currentNavigatorKey = navigatorKey ?? NSCustomNavigatorKey.fromContext(context);
    return NSListTile.navigationLink(
      customPadding: customPadding ?? NSPaddings.listTile,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      leading: leading,
      additionalInfo: additionalInfo,
      onTap: () => currentNavigatorKey.pushWidget(
        NSPickerPage(
          title: pickerTitle,
          goBackWithResult: currentNavigatorKey.goBack,
          list: list,
          optionBuilder: optionBuilder,
        ),
      ),
    );
  }
}
