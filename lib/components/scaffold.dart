part of ns_components;

class NSScaffold extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final bool isBusy;
  final bool isNavTitleHidden;
  final TextStyle? navLargeTitleTextStyle;
  final Widget? trailing;
  final Widget? leading;
  final bool absorbing;
  final Widget? bottom;
  final ScrollController? scrollController;
  final bool automaticallyImplyLeading;
  final Future<void> Function()? onRefresh;
  const NSScaffold({
    super.key,
    required this.title,
    required this.children,
    this.isBusy = false,
    this.isNavTitleHidden = false,
    this.navLargeTitleTextStyle,
    this.trailing,
    this.leading,
    this.absorbing = false,
    this.bottom,
    this.scrollController,
    this.automaticallyImplyLeading = true,
    this.onRefresh,
  });

  @override
  State<NSScaffold> createState() => _NSScaffoldState();
}

class _NSScaffoldState extends State<NSScaffold> {
  late ScrollController _scrollController;
  double? heightOfTitle;
  bool isTitleCentered = false;
  bool get isChildrenCupertinoList => widget.children is List<CupertinoListSection>;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
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
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CupertinoSliverNavigationBar(
                  border: !isTitleCentered
                      ? null
                      : Border(
                          bottom: BorderSide(color: CupertinoColors.opaqueSeparator.resolveFrom(context))),
                  largeTitle: MeasureSize(onChange: onChange, child: Text(widget.title)),
                  trailing: widget.trailing,
                  automaticallyImplyLeading: false,
                  transitionBetweenRoutes: false,
                  leading: widget.leading ??
                      (canPop && widget.automaticallyImplyLeading
                          ? GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                CupertinoIcons.arrow_left,
                                color: CupertinoColors.label.resolveFrom(context),
                                size: 26,
                              ),
                            )
                          : null),
                ),
                if (widget.onRefresh != null) CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
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
