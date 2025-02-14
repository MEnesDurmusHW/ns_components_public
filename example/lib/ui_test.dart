import 'package:example/subviews/button_colors_view.dart';
import 'package:example/subviews/colors_view.dart';
import 'package:example/subviews/form_fields_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:ns_components/ns_components.dart';

class UITest extends StatelessWidget {
  const UITest({super.key});

  @override
  Widget build(BuildContext context) {
    return NSScaffold(
      title: 'UI Test',
      children: [
        NSListSection(children: [
          NSListTile.navigationLink(
            title: 'Button Colors',
            onTap: navigator.onNavigateTo(const ButtonColorsView()),
          ),
          NSListTile.navigationLink(
            title: 'Form Fields',
            onTap: navigator.onNavigateTo(const FormFieldsView()),
          ),
          NSListTile.navigationLink(
            title: 'Colors',
            onTap: navigator.onNavigateTo(const ColorsView()),
          ),
        ]),
         const NSListSection(
          children: [
            NSListTile(title: 'systemBlue'),
            NSListTile(title: 'systemBlue'),
          ],
        ),
      ],
    );
  }
}
