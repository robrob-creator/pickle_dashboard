import 'package:pickle/controllers/my_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class CardsController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => FxTextUtils.getDummyText(60));

  FxShadowPosition shadowPosition = FxShadowPosition.center;
  double shadowElevation = 10;
  Color shadowColor = Colors.black;

  final GlobalKey shadowPositionKey = GlobalKey();

  void onChangePosition(FxShadowPosition position) {
    shadowPosition = position;
    update();
  }

  void onChangeElevation(double elevation) {
    shadowElevation = elevation;
    update();
  }

  void onChangeColor(Color color) {
    shadowColor = color;
    update();
  }

  @override
  String getTag() {
    return "cards_controller";
  }
}
