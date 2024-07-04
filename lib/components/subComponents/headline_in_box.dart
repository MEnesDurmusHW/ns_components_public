part of '../../ns_components.dart';

class NSHeadLineInBox extends StatelessWidget {
  final String title;
  final List<Color>? colors;
  const NSHeadLineInBox(
    this.title, {
    Key? key,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return LinearGradient(
                colors: colors ??
                    [
                      CupertinoColors.label.resolveFrom(context),
                      CupertinoColors.label.resolveFrom(context),
                    ])
            .createShader(bounds);
      },
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
