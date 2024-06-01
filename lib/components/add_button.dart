part of '../ns_components.dart';

class NSAddButton extends StatelessWidget {
  final VoidCallback? onTap;
  const NSAddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return NSTapGesture(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 24,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: CupertinoColors.white),
          ),
          const Icon(
            CupertinoIcons.add_circled_solid,
            size: 32,
          ),
        ],
      ),
    );
  }
}
