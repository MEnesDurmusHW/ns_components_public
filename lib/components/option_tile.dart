part of '../ns_components.dart';

class NSOptionTile<T> extends StatefulWidget {
  final String title;
  final List<T> options;
  final T? initialOption;
  final String Function(T option) optionTitleMapper;
  final Widget Function(T option)? trailingBuilder;
  final Widget Function(T option)? optionIconBuilder;
  final void Function(T? option) onChanged;
  const NSOptionTile({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
    required this.optionTitleMapper,
    this.trailingBuilder,
    this.optionIconBuilder,
    this.initialOption,
  });

  @override
  State<NSOptionTile<T>> createState() => _NSOptionTileState<T>();
}

class _NSOptionTileState<T> extends NSState<NSOptionTile<T>> {
  @override
  Set<MapEntry<ValueNotifier, VoidCallback>> get listenersMap => {MapEntry(selectedOneNotifier, onChoose)};

  final showOptionsNotifier = ValueNotifier(false);
  late final ValueNotifier<T?> selectedOneNotifier;

  @override
  void initState() {
    selectedOneNotifier = ValueNotifier(widget.initialOption);
    super.initState();
  }

  bool isSelectedOne(T option) => selectedOneNotifier.value == option;

  void onChoose() {
    widget.onChanged(selectedOneNotifier.value);
    showOptionsNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = NSDefaultEnabledWidget.maybeOf(context)?.isEnabled ?? true;
    return Column(
      children: [
        NSListTile(
          title: widget.title,
          onTap: isEnabled ? showOptionsNotifier.onToggle : null,
          trailing: Row(
            children: [
              DefaultTextStyle(
                style: context.textStyle.merge(
                  TextStyle(
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
                child: ValueListenableBuilder(
                  valueListenable: selectedOneNotifier,
                  builder: (context, selectedOne, _) {
                    if (widget.trailingBuilder != null && selectedOne != null) {
                      return widget.trailingBuilder!(selectedOne);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              if (isEnabled)
                Padding(
                  padding: const EdgeInsets.only(left: NSPaddingTypes.xs),
                  child: Icon(
                    CupertinoIcons.chevron_down,
                    size: CupertinoTheme.of(context).textTheme.textStyle.fontSize,
                    color: CupertinoColors.systemGrey2.resolveFrom(context),
                  ),
                )
            ],
          ),
        ),
        ValueListenableBuilder(
          valueListenable: showOptionsNotifier,
          builder: (context, showOptions, _) {
            return AnimatedSize(
              duration: NSRes.animationDuration,
              curve: Curves.easeInOutCirc,
              child: SizedBox(
                width: double.infinity,
                height: showOptions ? null : 0,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: widget.options.length,
                  separatorBuilder: (_, __) => const NSDivider(startPadding: 58),
                  itemBuilder: (_, i) {
                    final option = widget.options[i];
                    return NSListTile(
                      title: widget.optionTitleMapper(option),
                      leading: widget.optionIconBuilder?.call(option),
                      trailing: isSelectedOne(option)
                          ? const Icon(
                              CupertinoIcons.check_mark,
                              color: CupertinoColors.systemGreen,
                            )
                          : null,
                      onTap: () => selectedOneNotifier.value = option,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
