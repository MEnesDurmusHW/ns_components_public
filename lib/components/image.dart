part of '../ns_components.dart';

class NSImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  const NSImage(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.padding = NSPaddings.insetGroupedPadding,
    this.borderRadius = NSDecorations.borderRadius,
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
      padding: padding,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: image,
      ),
    );
  }
}
