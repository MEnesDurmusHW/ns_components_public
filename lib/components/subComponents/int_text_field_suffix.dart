part of ns_components;

class IntTextFieldSuffix extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const IntTextFieldSuffix({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: NSPaddingTypes.s),
      child: Row(
        children: [
          NSTapGesture(
            onTap: onIncrement,
            child: const Icon(CupertinoIcons.add),
          ),
          const SizedBox(width: NSPaddingTypes.s),
          NSTapGesture(
            onTap: onDecrement,
            child: const Icon(CupertinoIcons.minus),
          ),
        ],
      ),
    );
  }
}
