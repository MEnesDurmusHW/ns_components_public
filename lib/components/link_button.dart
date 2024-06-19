part of '../ns_components.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final String url;
  const LinkButton({super.key, required this.text, required this.url});

  void onPressed() {
    launchUrl(
      Uri.parse('https://menesdurmushw.github.io/stock_and_cook_pages/privacy_policy.html'),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
