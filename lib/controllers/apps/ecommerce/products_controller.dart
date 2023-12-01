import 'package:pickle/controllers/my_controller.dart';
import 'package:pickle/models/product.dart';
import 'package:flutx/flutx.dart';

class EcommerceProductsController extends MyController {
  List<Product> products = [];

  EcommerceProductsController();

  @override
  void initState() {
    super.initState();

    Product.dummyList.then((value) {
      products = value;
      update();
    });
  }

  void goToCreateProduct() {
    FxRouter.pushNamed(context, '/apps/ecommerce/add_product');
  }

  @override
  String getTag() {
    return "ecommerce_products_controller";
  }
}
