import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:target_sistemas_prova/app/data/models/sign_in/sign_in.model.dart';

abstract class SignInRepository {
  Future<bool> signIn(SignInModel signIn);
}

class ISignInRepository implements SignInRepository {
  @override
  Future<bool> signIn(SignInModel signIn) async {
    String data = await rootBundle.loadString('assets/mock/sign_in_mock.json');
    final dataJson = jsonDecode(data) as List;

    var signInCorrect = false;
    for (var e in dataJson) {
      if (e['username'] == signIn.username && e['password'] == signIn.password) {
        signInCorrect = true;
      }
    }

    await Future.delayed(const Duration(seconds: 1));
    return signInCorrect;
  }
}
