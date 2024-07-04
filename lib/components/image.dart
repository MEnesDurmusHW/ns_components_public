part of '../ns_components.dart';

class NSImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const NSImage(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      fadeInDuration: NSRes.animationDuration,
      placeholder: (_, __) => const CupertinoActivityIndicator(),
    );

    return Padding(
      padding: NSPaddings.insetGroupedPadding,
      child: ClipRRect(
        borderRadius: NSDecorations.borderRadius,
        child: image,
      ),
    );
  }
}
