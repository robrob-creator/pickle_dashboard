import 'package:pickle/controllers/my_controller.dart';
import 'package:pickle/models/customer.dart';

class DragDropController extends MyController {
  List<Customer> customers = [];

  DragDropController();

  @override
  void initState() {
    super.initState();
    Customer.dummyList.then((value) {
      customers = value;
      update();
    });
  }

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    Customer customer = customers.removeAt(oldIndex);
    customers.insert(newIndex, customer);
    update();
  }

  @override
  String getTag() {
    return "drag_drop_controller";
  }
}
