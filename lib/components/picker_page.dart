part of '../ns_components.dart';

class PickerPage<T> extends StatelessWidget {
  final String title;
  final NSNavigatorKey navigatorKey;
  final List<T> list;
  final String Function(T) mapper;
  final void Function(T result) onChoose;
  const PickerPage({super.key, required this.title, required this.navigatorKey, required this.list, required this.onChoose, required this.mapper});

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
        children: list
            .map((e) => CupertinoListTile(
                  title: Text(mapper(e)),
                  onTap: () => onChoose(e),
                ))
            .toList(),
      ),
    );
  }
}
