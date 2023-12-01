import 'dart:convert';

import 'package:pickle/models/identifier_model.dart';
import 'package:pickle/services/json_decoder.dart';
import 'package:flutter/services.dart';

class Customer extends IdentifierModel {
  final String firstName, lastName, phoneNumber;
  final double balance, ordersCount;
  final DateTime lastOrder;

  String get fullName => '$firstName $lastName';

  Customer(super.id, this.firstName, this.lastName, this.phoneNumber,
      this.balance, this.ordersCount, this.lastOrder);

  static Customer fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String firstName = decoder.getString('first_name');
    String lastName = decoder.getString('last_name');
    String phoneNumber = decoder.getString('phone_number');
    double balance = decoder.getDouble('balance');
    double ordersCount = decoder.getDouble('orders_count');
    DateTime lastOrder = decoder.getDateTime('last_order');

    return Customer(
      decoder.getId,
      firstName,
      lastName,
      phoneNumber,
      balance,
      ordersCount,
      lastOrder,
    );
  }

  static List<Customer> listFromJSON(List<dynamic> list) {
    return list.map((e) => Customer.fromJSON(e)).toList();
  }

  static List<Customer>? _dummyList;

  static Future<List<Customer>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 10);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/customers_data.json');
  }
}
