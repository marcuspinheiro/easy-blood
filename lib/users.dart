import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

import './user.dart';

class Users with ChangeNotifier {

  List<User> _items;

  List<User> get items {

    return [..._items];
  }

  User findById(String id) {
    return _items.firstWhere((usr) => usr.id == id);
  }

  void addUser(User user) {
    const url = 'https://flutter-update.firebaseio.com/Users.json';
    http.post(url, body: json.encode({
      'nome': user.nome,
      'email': user.email,
      'celular': user.phone,
      'cpf': user.cpf,
      'data': user.data,
      'bloodType': user.bloodType,
      'sexo': user.sex,
      'senha': user.senha,
      'confsenha': user.confsenha,
      'Doador': user.elegibleDonor,
      'Endereço': user.adress
    }),);
    final newUser = User(
      nome: user.nome,
      email: user.email,
      phone: user.phone,
      cpf: user.cpf,
      data: user.data,
      bloodType: user.bloodType,
      sex: user.sex,
      senha: user.senha,
      confsenha: user.confsenha,
      elegibleDonor: user.elegibleDonor,
      adress: user.adress, id: DateTime.now().toString(),
    );
    _items.add(newUser);
    // _items.insert(0, newUser); // at the start of the list
    notifyListeners();
  }
}