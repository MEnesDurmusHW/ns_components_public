part of ns_components;

typedef OnWidgetSizeChange = void Function(Size? size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  OnWidgetSizeChange? onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size? newSize = child?.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange?.call(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange? onChange;

  const MeasureSize({
    Key? key,
    this.onChange,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(BuildContext context, covariant MeasureSizeRenderObject renderObject) {
    renderObject.onChange = onChange;
  }
}

mixin SingleItemSingleTimeMeasureSizeStateMixin<T extends StatefulWidget> on State<T> {
  Size? _size;
  Size? get size => _size;
  void onChange(Size? size) {
    if (_size == null) {
      _size = size;
      updateState();
    }
  }
}

mixin SingleItemeMeasureSizeViewModelMixin on BaseViewModel {
  Size? _size;
  Size? get size => _size;
  void onChange(Size? size) {
    _size = size;
    notifyListeners();
  }
}
