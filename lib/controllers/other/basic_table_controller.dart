import 'dart:math';

import 'package:pickle/controllers/my_controller.dart';
import 'package:pickle/extensions/string.dart';
import 'package:flutx/flutx.dart';

class Data {
  final int id, qty;
  final String name;
  final String code;
  final double amount;

  Data(this.id, this.qty, this.name, this.code, this.amount);

  static factory([int seeds = 10]) {
    return List.generate(
        seeds,
        (index) => Data(
            index + 1,
            Random().nextInt(100),
            FxTextUtils.getDummyText(2, withStop: false),
            FxTextUtils.getDummyText(1, withStop: false).toLowerCase(),
            (Random().nextDouble() * 100).toStringAsPrecision(2).toDouble()));
  }
}

class BasicTableController extends MyController {
  List<Data> datas = Data.factory();

  BasicTableController();

  void onSelect(int index) {}

  @override
  String getTag() {
    return "basic_table_controller";
  }
}
