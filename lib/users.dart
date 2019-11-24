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
    const url = 'https://easybloodteste.herokuapp.com/public/users';
    http.post(url, body: json.encode({
      'bithDate': user.address,
      'bloodType': user.bloodType,
      'cpf': user.cpf,
      'eligibleDonor': user.eligibleDonor,
      'email': user.email,
      'id': user.id,
      'name': user.name,
      'password': user.password,
      'passwordConfirm': user.passwordConfirm,
      'phone': user.phone,
      'roles': user.roles,
      'sex': user.sex,
      'username': user.username
    }),);
    final newUser = User(
      name: user.name,
      bloodType: user.bloodType,
      cpf: user.cpf,
      eligibleDonor: user.eligibleDonor,
      email: user.email,
      id: user.id,
      password: user.password,
      passwordConfirm: user.passwordConfirm,
      phone: user.phone,
      roles: user.roles,
      sex: user.sex,
      username: user.username
    );
    _items.add(newUser);
    // _items.insert(0, newUser); // at the start of the list
    notifyListeners();
  }
}