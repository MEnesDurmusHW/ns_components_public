import 'package:flutter/cupertino.dart';
import 'package:ns_components/ns_components.dart';

class ButtonColorsView extends StatelessWidget {
  const ButtonColorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return NSScaffold(
      title: 'All Button Colors',
      trailing: const NSBrightnessToggle(),
      children: [
        NSSection(
          title: 'CupertinoColors',
          padding: EdgeInsets.zero,
          spacing: 0.0,
          children: [
            NSButton.filled(
              text: 'systemBlue',
              color: CupertinoColors.systemBlue.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemBrown',
              color: CupertinoColors.systemBrown.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemCyan',
              color: CupertinoColors.systemCyan.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemGreen',
              color: CupertinoColors.systemGreen.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemGrey',
              color: CupertinoColors.systemGrey.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemGrey2',
              color: CupertinoColors.systemGrey2.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemGrey3',
              color: CupertinoColors.systemGrey3.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemGrey4',
              color: CupertinoColors.systemGrey4.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemGrey5',
              color: CupertinoColors.systemGrey5.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemGrey6',
              color: CupertinoColors.systemGrey6.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemIndigo',
              color: CupertinoColors.systemIndigo.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemMint',
              color: CupertinoColors.systemMint.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemOrange',
              color: CupertinoColors.systemOrange.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemPink',
              color: CupertinoColors.systemPink.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemPurple',
              color: CupertinoColors.systemPurple.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemRed',
              color: CupertinoColors.systemRed.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemTeal',
              color: CupertinoColors.systemTeal.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'systemYellow',
              color: CupertinoColors.systemYellow.resolveFrom(context),
              onPressed: () {},
            ),
          ],
        ),
        NSSection(
          title: 'NSColors',
          padding: EdgeInsets.zero,
          spacing: 0.0,
          children: [
            NSButton.filled(
              text: 'blackWhite',
              color: NSColors.blackWhite.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'charcoalBlack',
              color: NSColors.charcoalBlack.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'whiteBlack',
              color: NSColors.whiteBlack.resolveFrom(context),
              onPressed: () {},
            ),
            NSButton.filled(
              text: 'primaryBlack',
              color: NSColors.primaryBlack.resolveFrom(context),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
