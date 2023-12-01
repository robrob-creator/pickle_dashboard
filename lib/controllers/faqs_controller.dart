import 'package:pickle/controllers/my_controller.dart';
import 'package:flutx/flutx.dart';

class FAQsController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => FxTextUtils.getDummyText(60));

  @override
  String getTag() {
    return 'FAQs_controller';
  }
}
