import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
  final String id;
  final String address;
  final String latitude;
  final String longitude;
  final String number;
  final String state;
  final String strees;
  final String bithDate;
  final String bloodType;
  final String cpf;
  final bool eligibleDonor;
  final String email;
  final String name;
  final String password;
  final String passwordConfirm;
  final String phone;
  final String roles;
  final String sex;
  final String username;

  User({
    @required this.id,
    @required this.address,
    @required this.latitude,
    @required this.longitude,
    @required this.number,
    @required this.state,
    @required this.strees,
    @required this.bithDate,
    @required this.bloodType,
    @required this.cpf,
    @required this.eligibleDonor,
    @required this.email,
    @required this.name,
    @required this.password,
    @required this.passwordConfirm,
    @required this.phone,
    @required this.roles,
    @required this.sex,
    @required this.username,
  });
}
