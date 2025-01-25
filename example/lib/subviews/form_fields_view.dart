import 'package:flutter/cupertino.dart';
import 'package:ns_components/ns_components.dart';
import 'package:intl/intl.dart';

class FormFieldsView extends StatelessWidget {
  const FormFieldsView({super.key});

  @override
  Widget build(BuildContext context) {
    return NSEnabledFormTextStyle.infoField(
      context: context,
      child: UnfocusableWidget(
        child: NSScaffold(
          title: 'Form & Info Fields',
          children: [
            const NSListSection(children: [const NSBrightnessToggleTile()]),
            NSListSection(
              children: [
                Builder(
                  builder: (context) {
                    final valueNotifier = ValueNotifier(true);
                    return ListenableBuilder(
                      listenable: valueNotifier,
                      builder: (context, _) {
                        return NSFormFieldWithToggle(
                          title: 'Toggle',
                          value: valueNotifier.value,
                          onChanged: null,
                        );
                      },
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    final valueNotifier = ValueNotifier(true);
                    return ListenableBuilder(
                      listenable: valueNotifier,
                      builder: (context, _) {
                        return NSFormFieldWithToggle(
                          title: 'Toggle',
                          value: valueNotifier.value,
                          onChanged: valueNotifier.onChanged,
                        );
                      },
                    );
                  },
                ),
                Builder(builder: (context) {
                  final valueNotifier = ValueNotifier(1);
                  final key = NSCustomNavigatorKey.fromContext(context);
                  return ValueListenableBuilder(
                      valueListenable: valueNotifier,
                      builder: (context, value, _) {
                        return NSPickerListTile(
                          list: const [1, 2, 3],
                          pickerTitle: 'Choose the number',
                          title: 'Picker with New page',
                          additionalInfo: Text(value.toString()),
                          navigatorKey: key,
                          optionBuilder: (e, goBackWithResult) => NSListTile(
                            title: e.toString(),
                            trailing: e == value ? const Icon(CupertinoIcons.check_mark) : null,
                            onTap: () {
                              valueNotifier.setValueIfNotNull(e);
                              key.goBack();
                            },
                          ),
                        );
                      });
                }),
                Builder(
                  builder: (context) {
                    final valueNotifier = ValueNotifier(DateTime.now());
                    return ValueListenableBuilder(
                      valueListenable: valueNotifier,
                      builder: (context, value, child) {
                        return NSDateTimeFormField(
                          mode: CupertinoDatePickerMode.date,
                          title: const Text('Date'),
                          initialDateTime: DateTime.now(),
                          actionChild: Text(value.formatDate()),
                          requireConfirm: true,
                          onDateTimeChanged: valueNotifier.setValueIfNotNull,
                        );
                      },
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    final valueNotifier = ValueNotifier(DateTime.now());
                    return ValueListenableBuilder(
                      valueListenable: valueNotifier,
                      builder: (context, value, child) {
                        return NSDateTimeFormField(
                          mode: CupertinoDatePickerMode.time,
                          title: const Text('Time'),
                          initialDateTime: DateTime.now(),
                          actionChild: Text(value.format(pattern: DateFormat.HOUR24_MINUTE)),
                          requireConfirm: true,
                          onDateTimeChanged: valueNotifier.setValueIfNotNull,
                        );
                      },
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    final valueNotifier = ValueNotifier(DateTime.now());
                    return ValueListenableBuilder(
                      valueListenable: valueNotifier,
                      builder: (context, value, child) {
                        return NSDateTimeFormField(
                          mode: CupertinoDatePickerMode.dateAndTime,
                          title: const Text('Date And Time'),
                          initialDateTime: DateTime.now(),
                          actionChild: Text(value.format(pattern: 'EEE, MMM dd HH:mm')),
                          requireConfirm: true,
                          onDateTimeChanged: valueNotifier.setValueIfNotNull,
                        );
                      },
                    );
                  },
                ),
                // CupertinoListTile(title: Text('CupertinoListTile')),
                // const NSListTile(title: 'NSListTile'),
                NSTextFieldTile(
                  title: 'Title',
                  isEnabled: true,
                  textMapper: (text) => text != null ? '${text.toUpperCase()} hrs' : '',
                  controller: TextEditingController(text: 'Text'),
                ),
              ],
            ),

            const NSListSection(
              title: 'Development',
              children: [
                NSListTile(
                  title: 'Form Field with Toggle',
                  trailing: Icon(CupertinoIcons.check_mark),
                ),
                NSListTile(
                  title: 'Picker with New Page',
                  trailing: Icon(CupertinoIcons.check_mark),
                ),
                NSListTile(
                  title: 'Picker with Date',
                  trailing: Icon(CupertinoIcons.check_mark),
                ),
                NSListTile(
                  title: 'Picker with Time',
                  trailing: Icon(CupertinoIcons.check_mark),
                ),
                NSListTile(
                  title: 'Picker with Date & Time',
                  trailing: Icon(CupertinoIcons.check_mark),
                ),
                NSListTile(
                  title: 'KeyValue Form Field',
                  trailing: Icon(CupertinoIcons.check_mark),
                ),
                NSListTile(
                  title: 'Stacked Form Field',
                  trailing: Icon(CupertinoIcons.hammer_fill),
                ),
                NSListTile(
                  title: 'Number Field',
                  trailing: Icon(CupertinoIcons.hammer_fill),
                ),
                NSListTile(
                  title: 'Currency Field',
                  trailing: Icon(CupertinoIcons.hammer_fill),
                ),
                NSListTile(title: 'Picker with Bottom Sheet'),
                NSListTile(title: 'Text Field with Multiline'),
                NSListTile(title: 'Picker with Expand'),
                NSListTile(title: 'Picker with Multi Select'),
                NSListTile(title: 'Password Field'),
                NSListTile(title: 'OTP Field'),
                NSListTile(title: 'PhoneNumber Field'),
                NSListTile(title: 'Rating Field'),
              ],
            )

            // NSDefaultEnabledWidget(
            //   isEnabled: true,
            //   child: NSListSection(
            //     children: [
            //       NSTextFieldTile(
            //         title: 'title',
            //         isEnabled: true,
            //         textMapper: (text) => text != null ? '${text.toUpperCase()} hrs' : '',
            //         controller: TextEditingController(text: 'Text'),
            //       ),
            //       NSTextFieldTile(
            //         title: 'title',
            //         isEnabled: false,
            //         textMapper: (text) => text != null ? '${text.toUpperCase()} hrs' : '',
            //         controller: TextEditingController(text: 'Text'),
            //       ),
            //       NSTextFieldTile(
            //         title: 'title',
            //         textMapper: (text) => text != null ? '${text.toUpperCase()} hrs' : '',
            //         controller: TextEditingController(text: 'Text'),
            //       ),
            //     ],
            //   ),
            // ),
            // // NSListSection(children: [
            //   /// Plain Text - Editable
            //   NSFormField<String>(
            //     fieldType: NSFormFieldType.plainText,
            //     label: "Name",
            //     value: "John Doe",
            //     readOnly: false,
            //     onChanged: (newValue) {
            //       print("Updated Name: $newValue");
            //     },
            //   ),

            //   /// Plain Text - ReadOnly
            //   const NSFormField<String>(
            //     fieldType: NSFormFieldType.plainText,
            //     label: "Name (ReadOnly)",
            //     value: "John Doe",
            //     readOnly: true,
            //   ),

            //   /// Multiline Text - Editable
            //   NSFormField<String>(
            //     fieldType: NSFormFieldType.multilineText,
            //     label: "Description",
            //     value: "This is a sample multiline description.",
            //     readOnly: false,
            //     onChanged: (newValue) {
            //       print("Updated Description: $newValue");
            //     },
            //   ),

            //   /// Integer - Editable
            //   NSFormField<int>(
            //     fieldType: NSFormFieldType.integer,
            //     label: "Age",
            //     value: 30,
            //     readOnly: false,
            //     onChanged: (newValue) {
            //       print("Updated Age: $newValue");
            //     },
            //   ),
            //   /// Integer - Editable
            //   NSFormField<int>(
            //     fieldType: NSFormFieldType.integer,
            //     label: "Age",
            //     value: 30,
            //     readOnly: true,
            //     onChanged: (newValue) {
            //       print("Updated Age: $newValue");
            //     },
            //   ),

            //   /// Decimal - Editable
            //   NSFormField<double>(
            //     fieldType: NSFormFieldType.decimal,
            //     label: "Salary",
            //     value: 5000.50,
            //     readOnly: false,
            //     onChanged: (newValue) {
            //       print("Updated Salary: $newValue");
            //     },
            //   ),

            //   /// Toggle - Editable
            //   NSFormField<bool>(
            //     fieldType: NSFormFieldType.toggle,
            //     label: "Active Status",
            //     value: true,
            //     readOnly: false,
            //     onChanged: (newValue) {
            //       print("Updated Status: $newValue");
            //     },
            //   ),

            //   /// Toggle - ReadOnly
            //   const NSFormField<bool>(
            //     fieldType: NSFormFieldType.toggle,
            //     label: "Active Status (ReadOnly)",
            //     value: true,
            //     readOnly: true,
            //   ),

            //   /// Custom ValueMapper (ReadOnly)
            //   NSFormField<int>(
            //     fieldType: NSFormFieldType.integer,
            //     label: "Priority",
            //     value: 1,
            //     readOnly: true,
            //     valueMapper: (value) {
            //       final priorities = ["Low", "Medium", "High"];
            //       return Text(
            //         "Priority: ${priorities[value ?? 0]}",
            //         style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            //               fontSize: 16,
            //               color: CupertinoColors.activeBlue,
            //             ),
            //       );
            //     },
            //   ),
            // ])
          ],
        ),
      ),
    );
  }
}
