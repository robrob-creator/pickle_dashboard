import 'package:pickle/controllers/my_controller.dart';

class ButtonsController extends MyController {
  List<bool> selected = List.filled(3, false);

  ButtonsController() {
    selected[0] = true;
  }

  void onSelect(int index) {
    selected = List.filled(3, false);
    selected[index] = true;
    update();
  }

  @override
  String getTag() {
    return "buttons_controller";
  }
}
