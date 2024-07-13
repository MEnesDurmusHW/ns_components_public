part of '../../../ns_components.dart';

class RateUsButton extends StatelessWidget {
  final String? title;
  const RateUsButton({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: nsLocaleNotifier,
      builder: (context, locale, _) {
        return NSListTile(
          title: title ?? _Localization.i.rateUs,
          leading: NSFilledIcon.byIcon(
            CupertinoIcons.star_fill,
            color: CupertinoColors.systemYellow.resolveFrom(context),
          ),
          onTap: rateApp.showRatePopUp,
        );
      },
    );
  }
}
