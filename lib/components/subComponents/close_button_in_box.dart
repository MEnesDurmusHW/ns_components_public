part of '../../ns_components.dart';

class NSCloseButtonInBox extends StatelessWidget {
  final VoidCallback onClose;
  const NSCloseButtonInBox({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NSTapGesture(
      onTap: onClose,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(
          CupertinoIcons.clear,
          size: 14,
          color: CupertinoColors.systemGrey,
        ),
      ),
    );
  }
}
