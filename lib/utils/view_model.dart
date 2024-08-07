part of '../ns_components.dart';

class ViewModelBuilder<T extends BaseViewModel> extends StatefulWidget {
  final T Function() viewModelBuilder;
  final Widget Function(BuildContext context, T viewModel) builder;
  final bool singleton;
  final bool disposeViewModel;
  const ViewModelBuilder({
    super.key,
    required this.viewModelBuilder,
    required this.builder,
    this.singleton = true,
    this.disposeViewModel = true,
  });

  @override
  State<ViewModelBuilder<T>> createState() => _ViewModelBuilderState<T>();
}

class _ViewModelBuilderState<T extends BaseViewModel> extends State<ViewModelBuilder<T>> {
  T? viewModel;
  static final Map<Type, dynamic> _viewModels = {};
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    if (widget.singleton) {
      viewModel = _viewModels[T];
      if (viewModel == null) {
        viewModel = widget.viewModelBuilder();
        _viewModels[T] = viewModel!;
      }
    } else {
      viewModel = widget.viewModelBuilder();
    }
    viewModel?.context = context;
    viewModel?.init();
  }

  void disposeViewModel() {
    if (viewModel?.disposed ?? true) return;
    _viewModels.remove(T);
    viewModel?.dispose();
  }

  @override
  void didUpdateWidget(ViewModelBuilder<T> oldWidget) {
    if(widget.singleton) return super.didUpdateWidget(oldWidget);
    _viewModels.remove(T);
    super.didUpdateWidget(oldWidget);
    init();
  }

  @override
  void deactivate() {
    if (widget.disposeViewModel) disposeViewModel();
    super.deactivate();
  }

  @override
  void dispose() {
    if (widget.disposeViewModel) disposeViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel != null) {
      return ListenableBuilder(
        listenable: viewModel!,
        builder: (context, child) => widget.builder.call(context, viewModel!),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

abstract class BaseViewModel extends Listenable with ChangeNotifier {
  late BuildContext context;
  bool _disposed = false;
  bool isBusy = false;
  bool get disposed => _disposed;
  Set<Listenable> get listenables => {};
  Set<MapEntry<Listenable, VoidCallback>> get listenersMap => {};

  void setBusy(bool value) {
    if (value == isBusy) return;
    isBusy = value;
    notifyListeners();
  }

  @mustCallSuper
  void init() {
    if (listenables.isNotEmpty) {
      for (final listenable in listenables) {
        listenable.addListener(notifyListeners);
      }
    }
    if (listenersMap.isNotEmpty) {
      for (final listenerMap in listenersMap) {
        listenerMap.key.addListener(listenerMap.value);
      }
    }
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    if (!disposed) _disposed = true;
    if (listenables.isNotEmpty) {
      for (final listenable in listenables) {
        listenable.removeListener(notifyListeners);
      }
    }
    if (listenersMap.isNotEmpty) {
      for (final listenerMap in listenersMap) {
        listenerMap.key.removeListener(listenerMap.value);
      }
    }
    super.dispose();
  }
}
