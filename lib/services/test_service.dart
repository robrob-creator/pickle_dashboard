import 'dart:convert';

import 'package:pickle/app_constant.dart';
import 'package:pickle/services/api_status.dart';
import 'package:http/http.dart' as http;
import 'package:pickle/models/test.dart';

class TestService {
  static Future<APIResponse<TestModel>> getTest(
      Map<String, dynamic>? params) async {
    TestModel billingModel;

    try {
      final uri =
          AppConstant.httpx("${AppConstant.baseDomain}", "/get-test", params);
      var response = await http.get(
        uri,
        headers: {
          "Content-Type": "text/json",
          "Accept": "*/*",
        },
      );

      if (response.statusCode == 401) {
        return APIResponse(statusCode: 401, success: false);
      }
      if ([200, 201, 204].contains(response.statusCode)) {
        var out = await json.decode(response.body);
        billingModel = TestModel.fromJson(out);
        return APIResponse(data: billingModel, statusCode: 200);
      }
      return APIResponse(statusCode: 400);
    } catch (err) {
      return APIResponse(success: false, statusCode: 500);
    }
  }
}
