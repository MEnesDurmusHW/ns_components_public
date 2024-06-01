part of '../../ns_components.dart';

class NSDisposableWidget extends StatefulWidget {
  final Widget child;
  final void Function(VoidCallback onClose) onAppear;
  final VoidCallback? onDisappear;
  final Duration animationDuration;
  const NSDisposableWidget({Key? key, required this.child, required this.onAppear, this.onDisappear, required this.animationDuration})
      : super(key: key);

  @override
  State<NSDisposableWidget> createState() => _DisposableWidgetState();
}

class _DisposableWidgetState extends State<NSDisposableWidget> {
  double? height;
  double opacity = 1.0;

  void onClose() {
    setState(() {
      height = 0.0;
      opacity = 0.0;
    });
    Future.delayed(widget.animationDuration, widget.onDisappear);
  }

  void onSizeChange(Size? size) {
    if (height == null) {
      setState(() {
        height = size?.height;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => widget.onAppear.call(onClose));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      duration: widget.animationDuration,
      child: MeasureSize(
        onChange: onSizeChange,
        child: AnimatedOpacity(
          duration: widget.animationDuration,
          opacity: opacity,
          child: widget.child,
        ),
      ),
    );
  }
}
