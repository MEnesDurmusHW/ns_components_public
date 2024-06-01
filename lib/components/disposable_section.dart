part of '../ns_components.dart';

class NSDisposableSection extends StatefulWidget {
  final String title;
  final Widget child;
  final Duration animationDuration;
  const NSDisposableSection({Key? key, required this.title, required this.child, this.animationDuration = const Duration(milliseconds: 450)})
      : super(key: key);

  @override
  State<NSDisposableSection> createState() => _DisposableSectionState();
}

class _DisposableSectionState extends State<NSDisposableSection> {
  bool isVisible = true;
  VoidCallback onClose = () {};

  void onAppearSetOnClose(VoidCallback onClose) => setState(() => this.onClose = onClose);

  void onDisappear() => setState(() => isVisible = false);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: NSListSection(
        children: [
          NSDisposableWidget(
            animationDuration: widget.animationDuration,
            onAppear: onAppearSetOnClose,
            onDisappear: onDisappear,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    NSPaddingTypes.s,
                    NSPaddingTypes.s,
                    0.0,
                    NSPaddingTypes.s,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NSHeadLineInBox(widget.title, colors: [context.theme.primaryColor, CupertinoColors.systemBlue.highContrastColor]),
                      const Spacer(),
                      NSCloseButtonInBox(onClose: onClose),
                    ],
                  ),
                ),
                const NSDivider(),
                Padding(
                  padding: const EdgeInsets.all(NSPaddingTypes.s),
                  child: widget.child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
