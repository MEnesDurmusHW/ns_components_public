part of '../ns_components.dart';

class NSOnBoarding extends StatelessWidget {
  final NSOnBoardingModel model;
  const NSOnBoarding(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ClipRRect(
        borderRadius: NSDecorations.borderRadius,
        child: CupertinoPageScaffold(
          backgroundColor: CupertinoColors.systemGroupedBackground.resolveFrom(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: NSPaddingTypes.xl),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: IconTheme(
                      data: IconTheme.of(context).copyWith(size: 48.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: NSPaddingTypes.xl),
                            child: Text(
                              model.title,
                              textAlign: TextAlign.center,
                              style: context.textTheme.navLargeTitleTextStyle,
                            ),
                          ),
                          ...model.items.map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: NSPaddingTypes.l),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: NSPaddingTypes.m),
                                    child: e.leadingBuilder(context),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.title,
                                        style: context.textStyle.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: context.width - (NSPaddingTypes.xl * 2) - (NSPaddingTypes.m) - (48.0),
                                        child: Text(e.description),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: NSButton.filled(
                    margin: EdgeInsets.zero,
                    text: model.continueButtonText,
                    onPressed: model.onContinue,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NSOnBoardingModel {
  final String title;
  final List<NSOnBoardingItem> items;
  final VoidCallback onContinue;
  final String continueButtonText;

  const NSOnBoardingModel({
    required this.title,
    required this.items,
    required this.onContinue,
    required this.continueButtonText,
  });
}

class NSOnBoardingItem {
  final Widget Function(BuildContext context) leadingBuilder;
  final String title;
  final String description;

  const NSOnBoardingItem({
    required this.leadingBuilder,
    required this.title,
    required this.description,
  });
}
