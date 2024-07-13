part of ns_components;

class FeedbackButton extends StatefulWidget implements NSWidget {
  final String? mailSubject;
  final String? title;
  const FeedbackButton({super.key, this.mailSubject, this.title});

  static Future<bool> checkCanLaunchUrl([String? mailSubject]) {
    try {
      return canLaunchUrlString(_getUrl(mailSubject));
    } catch (e) {
      logger.log(e);
    }
    return Future.value(false);
  }

  static String _getUrl([String? mailSubject]) {
    return mailSubject == null
        ? _FeedbackButtonState._baseUrl
        : '${_FeedbackButtonState._baseUrl}?subject=$mailSubject';
  }

  @override
  State<FeedbackButton> createState() => _FeedbackButtonState();

  @override
  EdgeInsets get padding => const EdgeInsets.all(15.0);
}

class _FeedbackButtonState extends State<FeedbackButton> {
  static const _baseUrl = "mailto:ns.developer.info@gmail.com";

  String get url => FeedbackButton._getUrl(widget.mailSubject);

  Future<void> feedback() {
    return launchUrlString(url);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: nsLocaleNotifier,
      builder: (_, __, ___) {
        return ValueListenableBuilder(
          valueListenable: nsInternalBrightnessNotifier,
          builder: (_, __, ___) {
            return NSListTile(
              title: widget.title ?? _Localization.i.feedback,
              leading: NSFilledIcon.byIcon(
                CupertinoIcons.mail_solid,
                color: CupertinoColors.systemGreen.resolveFrom(context),
              ),
              onTap: feedback,
            );
          },
        );
      },
    );
  }
}
