import 'package:pickle/models/identifier_model.dart';

class User extends IdentifierModel {
  final String email, firstName, lastName;

  User(super.id, this.email, this.firstName, this.lastName);

  String get name => "$firstName $lastName";

  // static User fromJSON(Map<String, dynamic> json) {
  //   JSONDecoder decoder = JSONDecoder(json);
  //
  //   String firstName = decoder.getString('first_name');
  //   String lastName = decoder.getString('last_name');
  //
  //   String email = decoder.getString('email');
  //
  //   String mobileNumber = decoder.getString('mobile_number');
  //
  //   String? avatar = decoder.getImageURLOrNull('avatar');
  //
  //   return User(
  //     decoder.getId,
  //     email,
  //     firstName,
  //     lastName,
  //     mobileNumber,
  //     avatar: avatar,
  //   );
  // }
}
