import 'package:pickle/controllers/my_controller.dart';
import 'package:flutx/flutx.dart';

class DialogsController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => FxTextUtils.getDummyText(60));

  DialogsController();

  @override
  String getTag() {
    return "dialogs_controller";
  }
}
