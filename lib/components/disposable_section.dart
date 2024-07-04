part of '../ns_components.dart';

class NSDisposableSection extends StatefulWidget {
  final String title;
  final Widget child;
  final Duration animationDuration;
  final List<Color>? titleColors;
  const NSDisposableSection({
    Key? key,
    required this.title,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 450),
    this.titleColors,
  }) : super(key: key);

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
            child: NSPreviewSection(
              title: widget.title,
              titleColors: widget.titleColors,
              trailing: NSCloseButtonInBox(onClose: onClose),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
