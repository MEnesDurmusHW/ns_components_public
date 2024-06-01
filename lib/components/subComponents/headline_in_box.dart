part of '../../ns_components.dart';

class NSHeadLineInBox extends StatelessWidget {
  final String title;
  final List<Color> colors;
  const NSHeadLineInBox(
    this.title, {
    Key? key,
    this.colors = const [
      CupertinoColors.systemGrey,
      CupertinoColors.systemGrey,
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(colors: colors).createShader(bounds);
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: CupertinoColors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
