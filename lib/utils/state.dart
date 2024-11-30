part of ns_components;

abstract class NSState<T extends StatefulWidget> extends State<T> {
  Set<MapEntry<Listenable, VoidCallback>> get listenersMap => {};

  @override
  void initState() {
    super.initState();
    if (listenersMap.isNotEmpty) {
      for (final listenerMap in listenersMap) {
        listenerMap.key.addListener(listenerMap.value);
      }
    }
  }

  @override
  void dispose() {
    if (listenersMap.isNotEmpty) {
      for (final listenerMap in listenersMap) {
        listenerMap.key.removeListener(listenerMap.value);
      }
    }
    super.dispose();
  }
}
