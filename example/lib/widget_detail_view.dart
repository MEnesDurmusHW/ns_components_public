import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ns_components/ns_components.dart';
import 'dart:math';
import 'dart:ui';

class WidgetDetailView extends StatelessWidget {
  final String title;
  final Widget widget;
  final String? code;
  final int? codeLine;
  const WidgetDetailView({
    super.key,
    required this.title,
    required this.widget,
    this.code,
    this.codeLine,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoUserInterfaceLevel(
      data: CupertinoUserInterfaceLevelData.elevated,
      child: Builder(
        builder: (context) {
          return NSScaffold(
            title: title,
            children: [
              widget,
              // DefaultTextStyle(
              //   style: context.textStyle.copyWith(fontWeight: FontWeight.w600),
              //   child: const Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Text('Light'),
              //       Text('Dark'),
              //     ],
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     widget,
              //     CupertinoTheme(
              //       data: context.theme.copyWith(brightness: Brightness.dark),
              //       child: widget,
              //     )
              //   ],
              // ),
              if (code != null)
                ClipRRect(
                  borderRadius: NSDecorations.borderRadius,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      DartCodeViewer(
                        code!,
                        height: codeLine == null ? null : 25.0 * codeLine!,
                        showCopyButton: false,
                        backgroundColor:
                            CupertinoColors.secondarySystemGroupedBackground.resolveFrom(context),
                      ),
                      NSTapGesture(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: code!));
                            if (context.mounted) showSuccessPopUp(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: NSPaddingTypes.s),
                            child: Icon(CupertinoIcons.square_on_square),
                          ))
                    ],
                  ),
                ),
            ]
                .map((e) => Padding(
                      padding: NSPaddings.insetGroupedPadding,
                      child: e,
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

void showSuccessPopUp(BuildContext context) {
  Future.delayed(const Duration(milliseconds: 800), navigator.goBack);
  showCupertinoDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const SuccessAlert(text: 'Copied'),
  );
}

class SuccessAlert extends StatelessWidget {
  final String text;
  const SuccessAlert({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: NSDecorations.borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            width: min(100 + context.width * 0.3, 200),
            height: min(100 + context.width * 0.3, 200),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: NSDecorations.borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  CupertinoColors.systemGrey6.resolveFrom(context).withOpacity(0.3),
                  CupertinoColors.systemGrey5.resolveFrom(context).withOpacity(0.8),
                ],
              ),
            ),
            padding: NSPaddings.insetGroupedPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 120,
                  color: CupertinoColors.label.resolveFrom(context).withOpacity(0.6),
                ),
                Text(
                  text,
                  style: context.textStyle.copyWith(
                    color: CupertinoColors.label.resolveFrom(context).withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
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
