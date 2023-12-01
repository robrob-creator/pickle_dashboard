import 'package:pickle/controllers/layouts/auth_layout_controller.dart';
import 'package:pickle/services/theme/admin_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutx/flutx.dart';

class AuthLayout extends StatelessWidget {
  final Widget? child;

  final AuthLayoutController controller = AuthLayoutController();

  AuthLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return FxResponsive(builder: (BuildContext context, _, screenMT) {
      return FxBuilder(
          controller: controller,
          builder: (controller) {
            return screenMT.isMobile
                ? mobileScreen(context)
                : largeScreen(context);
          });
    });
  }

  Widget mobileScreen(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Container(
        padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
        height: MediaQuery.of(context).size.height,
        color: theme.cardTheme.color,
        child: SingleChildScrollView(
          key: controller.scrollKey,
          child: child,
        ),
      ),
    );
  }

  Widget largeScreen(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Color(0xff006784),
        body: Stack(
          children: [
            Center(
              child: Opacity(
                  opacity: 0.2, child: BlurHash(hash: "BGF5]+Yk^6@-5c,1")),
            ),
            Container(
              margin: FxSpacing.top(100),
              width: MediaQuery.of(context).size.width,
              child: FxFlex(
                wrapAlignment: WrapAlignment.center,
                wrapCrossAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.center,
                spacing: 0,
                runSpacing: 0,
                children: [
                  FxFlexItem(
                    sizes: "xxl-3 lg-4 md-6 sm-8",
                    child: FxContainer(
                      paddingAll: 0,
                      color: AdminTheme.theme.contentTheme.background
                          .withAlpha(230),
                      child: child ?? Container(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
