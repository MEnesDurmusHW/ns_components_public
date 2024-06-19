part of '../../ns_components.dart';

class NSCheckMark extends StatelessWidget {
  const NSCheckMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.check_mark,
      color: CupertinoColors.systemGreen.resolveFrom(context),
    );
  }
}
