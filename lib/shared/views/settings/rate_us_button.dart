part of '../../../ns_components.dart';

class RateUsButton extends StatelessWidget {
  const RateUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: localeNotifier,
      builder: (context, locale, _) {
        return NSListTile(
          title: _Localization.i.rateUs,
          leading: NSFilledIcon(
            CupertinoIcons.star_fill,
            color: CupertinoColors.systemYellow.resolveFrom(context),
          ),
          onTap: rateApp.showRatePopUp,
        );
      },
    );
  }
}
