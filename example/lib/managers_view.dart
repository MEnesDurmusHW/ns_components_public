import 'package:flutter/cupertino.dart';
import 'package:ns_components/ns_components.dart';

class ManagersView extends StatelessWidget {
  const ManagersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NSScaffold(
      title: 'Managers',
      children: [
        NSListSection(
          children: [
            NSBrightnessToggleTile(),
            NSBrightnessListTile(),
          ],
        )
      ],
    );
  }
}
