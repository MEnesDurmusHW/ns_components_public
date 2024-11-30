part of '../ns_components.dart';

extension NSStateExtension<T extends StatefulWidget> on State<T> {
  void updateState() {
    if (mounted) context.updateState();
  }
}
