import 'dart:math';

import 'package:feather_icons/feather_icons.dart';
import 'package:pickle/controllers/forms/form_mask_controller.dart';
import 'package:pickle/extensions/extensions.dart';
import 'package:pickle/utils/mixins/ui_mixin.dart';
import 'package:pickle/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutx/flutx.dart';

class FormMaskPage extends StatefulWidget {
  const FormMaskPage({Key? key}) : super(key: key);

  @override
  State<FormMaskPage> createState() => _FormMaskPageState();
}

class _FormMaskPageState extends State<FormMaskPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late FormMaskController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(FormMaskController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: FxBuilder(
        controller: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: FxSpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.titleMedium(
                      "Form Masks",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    FxBreadcrumb(
                      children: [
                        FxBreadcrumbItem(name: 'forms'.tr()),
                        FxBreadcrumbItem(name: 'masks'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(flexSpacing),
              Padding(
                  padding: FxSpacing.x(flexSpacing),
                  child: FxContainer.bordered(
                    padding: FxSpacing.bottom(flexSpacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: colorScheme.primary.withOpacity(0.08),
                          padding: FxSpacing.xy(flexSpacing, 12),
                          child: Row(
                            children: [
                              Icon(
                                FeatherIcons.fileText,
                                size: 16,
                                color: colorScheme.primary,
                              ),
                              FxSpacing.width(12),
                              FxText.titleMedium(
                                "Form Mask",
                                fontWeight: 600,
                                color: colorScheme.primary,
                              ),
                            ],
                          ),
                        ),
                        FxSpacing.height(flexSpacing),
                        Padding(
                            padding: FxSpacing.x(flexSpacing / 2),
                            child: FxFlex(
                              children: [
                                FxFlexItem(
                                  sizes: "lg-6 md-12",
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FxText.labelMedium(
                                        "Date Style 1",
                                      ),
                                      FxSpacing.height(8),

                                      TextFormField(
                                        inputFormatters: [
                                          DateTextFormatter(),
                                        ],
                                        decoration: InputDecoration(
                                            border: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            focusedBorder: focusedInputBorder,
                                            contentPadding: FxSpacing.all(16),
                                            isCollapsed: true,
                                            helperText: '"dd/mm/yyy"',
                                            helperStyle: FxTextStyle.bodySmall(
                                                muted: true)),
                                      ),
                                      // FxSpacing.height(4),
                                      // FxText.bodySmall("\"dd/mm/yyy\""),
                                    ],
                                  ),
                                ),
                                FxFlexItem(
                                  sizes: "lg-6 md-12",
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FxText.labelMedium(
                                        "Date Style 1",
                                      ),
                                      FxSpacing.height(8),

                                      TextFormField(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10),
                                          PhoneInputFormatter(),
                                        ],
                                        decoration: InputDecoration(
                                            border: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            focusedBorder: focusedInputBorder,
                                            contentPadding: FxSpacing.all(16),
                                            isCollapsed: true,
                                            helperText: '"123456789"',
                                            helperStyle: FxTextStyle.bodySmall(
                                                muted: true)),
                                      ),
                                      // FxSpacing.height(4),
                                      // FxText.bodySmall("\"dd/mm/yyy\""),
                                    ],
                                  ),
                                ),
                                FxFlexItem(
                                  sizes: "lg-6 md-12",
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FxText.labelMedium(
                                        "Date Style 2",
                                      ),
                                      FxSpacing.height(8),

                                      TextFormField(
                                        inputFormatters: [
                                          DateTextFormatter(),
                                        ],
                                        decoration: InputDecoration(
                                            border: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            focusedBorder: focusedInputBorder,
                                            contentPadding: FxSpacing.all(16),
                                            isCollapsed: true,
                                            helperText: '"mm/dd/yyy"',
                                            helperStyle: FxTextStyle.bodySmall(
                                                muted: true)),
                                      ),
                                      // FxSpacing.height(4),
                                      // FxText.bodySmall("\"dd/mm/yyy\""),
                                    ],
                                  ),
                                ),
                                FxFlexItem(
                                  sizes: "lg-6 md-12",
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FxText.labelMedium(
                                        "Mask",
                                      ),
                                      FxSpacing.height(8),

                                      TextFormField(
                                        inputFormatters: [
                                          MaskTextFormatter(),
                                        ],
                                        decoration: InputDecoration(
                                            border: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            focusedBorder: focusedInputBorder,
                                            contentPadding: FxSpacing.all(16),
                                            isCollapsed: true,
                                            helperText: '"00-0000000"',
                                            helperStyle: FxTextStyle.bodySmall(
                                                muted: true)),
                                      ),
                                      // FxSpacing.height(4),
                                      // FxText.bodySmall("\"dd/mm/yyy\""),
                                    ],
                                  ),
                                ),
                                FxFlexItem(
                                  sizes: "lg-6 md-12",
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FxText.labelMedium(
                                        "IP address",
                                      ),
                                      FxSpacing.height(8),

                                      TextFormField(
                                        inputFormatters: [
                                          IpAddressInputFormatter(),
                                        ],
                                        decoration: InputDecoration(
                                            border: outlineInputBorder,
                                            enabledBorder: outlineInputBorder,
                                            focusedBorder: focusedInputBorder,
                                            contentPadding: FxSpacing.all(16),
                                            isCollapsed: true,
                                            helperText: '"99.99.99.99"',
                                            helperStyle: FxTextStyle.bodySmall(
                                                muted: true)),
                                      ),
                                      // FxSpacing.height(4),
                                      // FxText.bodySmall("\"dd/mm/yyy\""),
                                    ],
                                  ),
                                ),
                                FxFlexItem(
                                  sizes: "lg-6 md-12",
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FxText.labelMedium(
                                        "Email address",
                                      ),
                                      FxSpacing.height(8),
                                      Form(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value != null &&
                                                value.isEmpty) {
                                              return 'Email is required';
                                            }
                                            if (value != null &&
                                                !FxStringUtils.isEmail(value)) {
                                              return 'Invalid Email';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              border: outlineInputBorder,
                                              enabledBorder: outlineInputBorder,
                                              focusedBorder: focusedInputBorder,
                                              contentPadding: FxSpacing.all(16),
                                              isCollapsed: true,
                                              helperText: '"_@_._"',
                                              helperStyle:
                                                  FxTextStyle.bodySmall(
                                                      muted: true)),
                                        ),
                                      ),
                                      // FxSpacing.height(4),
                                      // FxText.bodySmall("\"dd/mm/yyy\""),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}

//-----------------------Date Formatter-----------------------//
class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';
    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}

//-----------------------Phone Number-----------------------//
class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');

    return newValue.copyWith(
      text: text.isNotEmpty ? '$text' : '',
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

//-----------------------IP address-----------------------//
class IpAddressInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    int dotCounter = 0;
    var buffer = StringBuffer();
    String ipField = "";

    for (int i = 0; i < text.length; i++) {
      if (dotCounter < 4) {
        if (text[i] != ".") {
          ipField += text[i];
          if (ipField.length < 3) {
            buffer.write(text[i]);
          } else if (ipField.length == 3) {
            if (int.parse(ipField) <= 255) {
              buffer.write(text[i]);
            } else {
              if (dotCounter < 3) {
                buffer.write(".");
                dotCounter++;
                buffer.write(text[i]);
                ipField = text[i];
              }
            }
          } else if (ipField.length == 4) {
            if (dotCounter < 3) {
              buffer.write(".");
              dotCounter++;
              buffer.write(text[i]);
              ipField = text[i];
            }
          }
        } else {
          if (dotCounter < 3) {
            buffer.write(".");
            dotCounter++;
            ipField = "";
          }
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

//-----------------------Mask Formatter-----------------------//
class MaskTextFormatter extends TextInputFormatter {
  static const _maxChars = 10;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '-');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';
    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1) && i != value.length - 1) {
        newString += seperator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
