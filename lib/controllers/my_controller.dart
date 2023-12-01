import 'package:pickle/services/theme/theme_customizer.dart';
import 'package:flutx/flutx.dart';

abstract class MyController extends FxController {
  @override
  void initState() {
    super.initState();
    ThemeCustomizer.addListener((old, newVal) {
      if (old.theme != newVal.theme ||
          (old.currentLanguage.languageName !=
              newVal.currentLanguage.languageName)) {
        update();
      }
    });
  }
}
