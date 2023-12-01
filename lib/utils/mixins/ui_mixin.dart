import 'package:pickle/services/theme/admin_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

mixin UIMixin {
  // ThemeData get theme => AppStyle.theme;
  LeftBarTheme get leftBarTheme => AdminTheme.theme.leftBarTheme;
  TopBarTheme get topBarTheme => AdminTheme.theme.topBarTheme;
  RightBarTheme get rightBarTheme => AdminTheme.theme.rightBarTheme;
  ContentTheme get contentTheme => AdminTheme.theme.contentTheme;

  VisualDensity get getCompactDensity =>
      VisualDensity(horizontal: -4, vertical: -4);

  // ColorScheme get colorScheme => theme.colorScheme;

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
            width: 1,
            strokeAlign: 0,
            color: colorScheme.onBackground.withAlpha(80)),
      );

  OutlineInputBorder focusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(width: 1, color: colorScheme.primary),
  );

  OutlineInputBorder generateOutlineInputBorder({double radius = 4}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      );

  OutlineInputBorder generateFocusedInputBorder({double radius = 4}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(width: 1, color: colorScheme.primary),
      );

  Widget getBackButton(FxNavigationMixin navigationMixin) {
    return InkWell(
      onTap: navigationMixin.goBack,
      child: Center(
        child: MSIcon(
          'chevron_left',
          size: 26,
          color: colorScheme.onBackground,
        ),
      ),
    );
  }

  Widget getDashedDivider() {
    return FxDashedDivider(
        dashWidth: 6,
        dashSpace: 4,
        color: colorScheme.onBackground.withAlpha(64),
        height: 0.5);
  }
}
