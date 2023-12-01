import 'package:pickle/controllers/my_controller.dart';
import 'package:pickle/models/customer.dart';
import 'package:flutx/flutx.dart';

class CustomersController extends MyController {
  List<Customer> customers = [];

  CustomersController();

  @override
  void initState() {
    super.initState();
    Customer.dummyList.then((value) {
      customers = value;
      update();
    });
  }

  void goToDashboard() {
    FxRouter.pushNamed(context, '/dashboard');
  }

  @override
  String getTag() {
    return 'customers_controller';
  }
}
