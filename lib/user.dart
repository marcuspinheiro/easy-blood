import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
  final String id;
  final String nome;
  final String email;
  final String phone;
  final String cpf;
  final String data;
  final String bloodType;
  final String sex;
  final String senha;
  final String confsenha;
  final bool elegibleDonor; 
  final String adress;

  User({
    @required this.id,
    @required this.nome,
    @required this.email,
    @required this.phone,
    @required this.cpf,
    @required this.data,
    @required this.bloodType,
    @required this.sex,
    @required this.senha,
    @required this.confsenha,
    @required this.elegibleDonor,
    @required this.adress
  });
}
