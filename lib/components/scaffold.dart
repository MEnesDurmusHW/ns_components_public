part of ns_components;

class NSScaffold extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final bool isBusy;
  final bool isNavTitleHidden;
  final TextStyle? navLargeTitleTextStyle;
  final Widget? trailing;
  final bool absorbing;
  final Widget? bottom;
  const NSScaffold({
    Key? key,
    required this.title,
    required this.children,
    this.isBusy = false,
    this.isNavTitleHidden = false,
    this.navLargeTitleTextStyle,
    this.trailing,
    this.absorbing = false,
    this.bottom,
  }) : super(key: key);

  @override
  State<NSScaffold> createState() => _NSScaffoldState();
}

class _NSScaffoldState extends State<NSScaffold> {
  final ScrollController _scrollController = ScrollController();
  double? heightOfTitle;
  bool isTitleCentered = false;
  bool get isChildrenCupertinoList => widget.children is List<CupertinoListSection>;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final double offset = _scrollController.offset;
    if (!isTitleCentered && offset > heightOfTitle!) {
      setState(() => isTitleCentered = true);
    } else if (isTitleCentered && offset < heightOfTitle!) {
      setState(() => isTitleCentered = false);
    }
  }

  void onChange(Size? size) {
    if (heightOfTitle == null && size != null) heightOfTitle = size.height + 10;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    return AbsorbPointer(
      absorbing: widget.absorbing,
      child: CupertinoPageScaffold(
        backgroundColor: NSColors.background,
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CupertinoSliverNavigationBar(
                  border: !isTitleCentered
                      ? null
                      : Border(
                          bottom: BorderSide(color: CupertinoColors.systemBackground.withOpacity(0.5)),
                        ),
                  largeTitle: MeasureSize(onChange: onChange, child: Text(widget.title)),
                  trailing: widget.trailing,
                  automaticallyImplyLeading: false,
                  backgroundColor: NSColors.partiallyTransparentBackground,
                  transitionBetweenRoutes: false,
                  leading: canPop
                      ? GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            CupertinoIcons.arrow_left,
                            color: CupertinoColors.label.resolveFrom(context),
                            size: 26,
                          ),
                        )
                      : null,
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 4.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      ...widget.children,
                      SizedBox(height: MediaQuery.paddingOf(context).bottom),
                    ]),
                  ),
                ),
              ],
            ),
            if (widget.isBusy) const Center(child: CupertinoActivityIndicator()),
            if (widget.bottom != null) Align(alignment: Alignment.bottomCenter, child: widget.bottom!),
          ],
        ),
      ),
    );
  }
}
