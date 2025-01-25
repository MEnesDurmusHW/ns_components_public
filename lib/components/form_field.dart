part of '../ns_components.dart';

class NSDateTimeFormField extends StatelessWidget {
  final CupertinoDatePickerMode mode;
  final ValueChanged<DateTime> onDateTimeChanged;
  final DateTime initialDateTime;
  final Widget title;
  final Widget actionChild;
  final bool requireConfirm;
  final String confirmButtonText;
  final ValueNotifier<DateTime> currentSelectedDate;
  NSDateTimeFormField({
    super.key,
    this.mode = CupertinoDatePickerMode.dateAndTime,
    required this.onDateTimeChanged,
    this.requireConfirm = false,
    this.confirmButtonText = 'Confirm',
    required this.title,
    required this.actionChild,
    required this.initialDateTime,
  }) : currentSelectedDate = ValueNotifier(initialDateTime);

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      padding: NSPaddings.listTile,
      prefix: title,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ColoredBox(
                  color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          context.pop();
                          onDateTimeChanged(currentSelectedDate.value);
                        },
                        child: Text(
                          confirmButtonText,
                          style: context.textTheme.actionTextStyle
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                NSBlurredWidget(
                  child: ColoredBox(
                    color: CupertinoColors.systemGroupedBackground
                        .resolveFrom(context)
                        .withOpacity(0.7),
                    child: SizedBox(
                      height: context.height * 0.2 + 200,
                      child: CupertinoDatePicker(
                        initialDateTime: initialDateTime,
                        mode: mode,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newDate) {
                          currentSelectedDate.setValue(newDate);
                          if (requireConfirm) return;
                          onDateTimeChanged(newDate);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        child: actionChild,
      ),
    );
  }
}

// class NSFormFieldWithDate extends StatelessWidget {
//   final ValueChanged<DateTime> onDateTimeChanged;
//   final DateTime initialDateTime;
//   final Widget title;
//   final Widget actionChild;
//   final bool requireConfirm;
//   final String confirmButtonText;
//   final ValueNotifier<DateTime> currentSelectedDate;
//   NSFormFieldWithDate({
//     super.key,
//     required this.onDateTimeChanged,
//     this.requireConfirm = false,
//     this.confirmButtonText = 'Confirm',
//     required this.title,
//     required this.actionChild,
//     required this.initialDateTime,
//   }) : currentSelectedDate = ValueNotifier(initialDateTime);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoFormRow(
//       padding: NSPaddings.listTile,
//       prefix: title,
//       child: CupertinoButton(
//         padding: EdgeInsets.zero,
//         onPressed: () {
//           showCupertinoModalPopup(
//             context: context,
//             builder: (context) => Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ColoredBox(
//                   color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       CupertinoButton(
//                         onPressed: () {
//                           context.pop();
//                           onDateTimeChanged(currentSelectedDate.value);
//                         },
//                         child: Text(
//                           confirmButtonText,
//                           style: context.textTheme.actionTextStyle
//                               .copyWith(fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 NSBlurredWidget(
//                   child: ColoredBox(
//                     color: CupertinoColors.systemGroupedBackground
//                         .resolveFrom(context)
//                         .withOpacity(0.7),
//                     child: SizedBox(
//                       height: context.height * 0.2 + 200,
//                       child: CupertinoDatePicker(
//                         initialDateTime: initialDateTime,
//                         mode: CupertinoDatePickerMode.date,
//                         onDateTimeChanged: (DateTime newDate) {
//                           currentSelectedDate.setValue(newDate);
//                           if (requireConfirm) return;
//                           onDateTimeChanged(newDate);
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//         child: actionChild,
//       ),
//     );
//   }
// }

// class NSFormFieldWithTime extends StatelessWidget {
//   final ValueChanged<DateTime> onDateTimeChanged;
//   final DateTime initialDateTime;
//   final Widget title;
//   final Widget actionChild;
//   final bool requireConfirm;
//   final String confirmButtonText;
//   final ValueNotifier<DateTime> currentSelectedDate;
//   NSFormFieldWithTime({
//     super.key,
//     required this.onDateTimeChanged,
//     this.requireConfirm = false,
//     this.confirmButtonText = 'Confirm',
//     required this.title,
//     required this.actionChild,
//     required this.initialDateTime,
//   }) : currentSelectedDate = ValueNotifier(initialDateTime);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoFormRow(
//       padding: NSPaddings.listTile,
//       prefix: title,
//       child: CupertinoButton(
//         padding: EdgeInsets.zero,
//         onPressed: () {
//           showCupertinoModalPopup(
//             context: context,
//             builder: (context) => Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ColoredBox(
//                   color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       CupertinoButton(
//                         onPressed: () {
//                           context.pop();
//                           onDateTimeChanged(currentSelectedDate.value);
//                         },
//                         child: Text(
//                           confirmButtonText,
//                           style: context.textTheme.actionTextStyle
//                               .copyWith(fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 NSBlurredWidget(
//                   child: ColoredBox(
//                     color: CupertinoColors.systemGroupedBackground
//                         .resolveFrom(context)
//                         .withOpacity(0.7),
//                     child: SizedBox(
//                       height: context.height * 0.2 + 200,
//                       child: CupertinoDatePicker(
//                         initialDateTime: initialDateTime,
//                         mode: CupertinoDatePickerMode.time,
//                         use24hFormat: true,
//                         onDateTimeChanged: (DateTime newDate) {
//                           currentSelectedDate.setValue(newDate);
//                           if (requireConfirm) return;
//                           onDateTimeChanged(newDate);
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//         child: actionChild,
//       ),
//     );
//   }
// }

// class NSFormField<T> extends NSStatelessWidget {
//   final NSFormFieldType? fieldType;
//   final bool readOnly;
//   final String label;
//   final T? value;
//   // final 
//   final Widget Function(T? value)? valueMapper;
//   final void Function(String)? onChanged;
//   final bool autofocus;

//   const NSFormField(
//       {super.key,
//       required this.fieldType,
//       required this.label,
//       this.readOnly = false,
//       this.value,
//       this.valueMapper,
//       this.onChanged,
//       this.autofocus = false});

//   @override
//   EdgeInsets get padding => NSPaddings.listTile;

//   NSFormFieldType get checkedFieldType {
//     if (fieldType != null) return fieldType!;
//     if (T is bool) {
//       return NSFormFieldType.toggle;
//     } else if (T is int) {
//       return NSFormFieldType.integer;
//     } else if (T is double) {
//       return NSFormFieldType.decimal;
//     } else {
//       return NSFormFieldType.plainText;
//     }
//   }

//   bool get hasTextField => checkedFieldType != NSFormFieldType.toggle;

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTextField.borderless(
//       autofocus: autofocus,
//       padding: NSPaddings.listTile,
//       readOnly: !hasTextField || readOnly,
//       textAlign: TextAlign.end,
//       // suffix: _buildValueWidget(context),
//       keyboardType: checkedFieldType.keyboardType,
//       style: context.textStyle.copyWith(
//         color: readOnly ? context.textStyle.color : context.primaryColor.resolveFrom(context),
//       ),
//       // controller: hasTextField ? TextEditingController(text: value.toString()) : null,
//       prefix: Padding(
//         padding: NSPaddings.listTileWithVertical.copyWith(
//           left: NSPaddings.listTile.left + NSPaddingTypes.xs,
//         ),
//         child: SizedBox(
//           width: context.width * 0.32,
//           child: Text(
//             label,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget? _buildValueWidget(BuildContext context) {
//     if (readOnly && valueMapper != null) {
//       return valueMapper!(value);
//     }
//     if (hasTextField) return null;

//     switch (fieldType) {
//       case NSFormFieldType.plainText:
//       case NSFormFieldType.multilineText:
//         return Text(value.toString());

//       case NSFormFieldType.integer:
//       case NSFormFieldType.decimal:
//       case NSFormFieldType.positiveNumber:
//         return CupertinoTextField(
//           controller: TextEditingController(text: value?.toString()),
//           onChanged: onChanged,
//           readOnly: readOnly,
//           keyboardType: checkedFieldType == NSFormFieldType.decimal
//               ? const TextInputType.numberWithOptions(decimal: true)
//               : TextInputType.number,
//           decoration: BoxDecoration(
//             color: readOnly ? CupertinoColors.systemGrey6 : CupertinoColors.white,
//             border: Border.all(color: CupertinoColors.systemGrey4),
//             borderRadius: BorderRadius.circular(8),
//           ),
//         );

//       case NSFormFieldType.toggle:
//         return Padding(
//           padding: const EdgeInsets.only(right: NSPaddingTypes.s),
//           child: CupertinoSwitch(
//             value: value == true,
//             onChanged: readOnly ? null : (bool newValue) => onChanged?.call(newValue.toString()),
//           ),
//         );

//       default:
//         return Text(
//           value?.toString() ?? '-',
//           style: context.textStyle.copyWith(fontSize: 16),
//         );
//     }
//   }
// }

// enum NSFormFieldType {
//   plainText,
//   multilineText,
//   integer,
//   decimal,
//   positiveNumber,
//   toggle,
// }

// extension NSFormFieldTypeExtension on NSFormFieldType {
//   TextInputType get keyboardType {
//     switch (this) {
//       case NSFormFieldType.plainText:
//         return TextInputType.text;
//       case NSFormFieldType.multilineText:
//         return TextInputType.multiline;
//       case NSFormFieldType.integer:
//         return TextInputType.number;
//       case NSFormFieldType.decimal:
//         return const TextInputType.numberWithOptions(decimal: true);
//       case NSFormFieldType.positiveNumber:
//         return TextInputType.number;
//       case NSFormFieldType.toggle:
//         // For toggle, we don't need a keyboard input, so returning TextInputType.text is safe
//         return TextInputType.text;
//     }
//   }
// }
