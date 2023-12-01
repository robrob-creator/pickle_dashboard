import 'dart:developer';

import 'package:pickle/controllers/my_controller.dart';
import 'package:pickle/controllers/other/syncfusion_charts_controller.dart';
import 'package:pickle/models/customer.dart';
import 'package:pickle/models/product.dart';
import 'package:pickle/models/test.dart';
import 'package:pickle/services/test_service.dart';
import 'package:flutx/flutx.dart';

class DashboardController extends MyController {
  DashboardController();

  List<Product> products = [];
  List<Customer> customers = [];
  List<ListElement> listElements = [];

  TestModel tests = TestModel();
  bool isLoading = false;
  DateTime now = DateTime(2023, 9);
  Map<String, String> params = {"pageSize": "100"};

  @override
  void initState() async {
    super.initState();
    await getTests();
  }

  Future getTests() async {
    isLoading = true;
    var res = await TestService.getTest(params);
    tests = res.data ?? TestModel();
    isLoading = false;
    update();
  }

  void goToProducts() {
    FxRouter.pushNamed(context, '/apps/ecommerce/products');
  }

  void addListElemet(ListElement listElement) {
    listElements.add(listElement);
    update();
    inspect(listElements);
  }

  void addElemet(List<Element> element) {
    listElements.firstOrNull?.elements?.addAll(element);
    update();
    inspect(listElements);
  }

  void addParams(Map<String, String> parameter) {
    params = {...parameter};
    update();
    inspect(listElements);
  }

  void removeElementById(String id) {
    listElements.forEach((listElement) {
      listElement.elements?.removeWhere((element) => element.id == id);
    });
    update();
    inspect(listElements);
  }

  void removeById(String id) {
    listElements.removeWhere((element) => element.id == id);
    update();
    inspect(listElements);
  }

  void goToCustomers() {
    FxRouter.pushNamed(context, '/apps/ecommerce/customers');
  }

  @override
  String getTag() {
    return "dashboard_controller";
  }
}
