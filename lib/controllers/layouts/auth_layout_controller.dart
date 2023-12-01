import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class AuthLayoutController extends FxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final scrollKey = GlobalKey();

  @override
  String getTag() {
    return "auth_layout_controller";
  }
}
