part of ns_components;

mixin class NSListenable<T> implements Listenable {
  final Set<VoidCallback> _listeners = {};

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }
}

extension NSBoolValueNotifierExtension on ValueNotifier<bool> {
  void onChanged(bool newValue) => value = newValue;
  void onToggle() => value = !value;
}

extension NSGenericValueNotifierExtension<T> on ValueNotifier<T?> {
  T? setValue(T? newValue) => value = newValue;
  T? setValueIfNotNull(T? newValue) {
    if (newValue != null) value = newValue;
    return null;
  }
}
