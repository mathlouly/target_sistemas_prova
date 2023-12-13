// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:target_sistemas_prova/app/data/models/sign_in/sign_in.model.dart';
import 'package:target_sistemas_prova/app/data/repositories/sign_in.repository.dart';
import 'package:target_sistemas_prova/app/router/router.dart';
import 'package:target_sistemas_prova/app/router/routes.dart';
import 'package:url_launcher/url_launcher.dart';

part 'sign_in.store.g.dart';

class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {
  final SignInRepository _signInRepository;

  _SignInStore(this._signInRepository);

  final textUsername = TextEditingController();
  final textPassword = TextEditingController();

  @observable
  bool loading = false;

  @observable
  String? msgResponse;

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  String? validatorUsername(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'O usuário é obrigatório';
    if (value.length > 20) return 'O usuário pode conter mais que 20 caracteres';
    if (value[value.length - 1] == ' ') return 'O útlimo caracter não pode ser um espaço vazio';

    return null;
  }

  String? validatorPassword(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'A senha é obrigatória';
    if (value.length < 2) return 'A senha deve conter pelo menos 2 caracteres';
    if (value.length > 20) return 'A senha não pode conter mais que 20 caracteres';
    if (!RegExp(r'^[a-zA-Z0-9]*$').hasMatch(value)) return 'A senha não deve conter caracteres especiais';

    return null;
  }

  @action
  void submit() {
    if (_formKey.currentState!.validate()) {
      loading = true;

      final signIn = SignInModel(
        username: textUsername.text,
        password: textPassword.text,
      );

      _signInRepository.signIn(signIn).then((value) {
        if (value) {
          CustomRouter.go(Routes.home);
        } else {
          msgResponse = 'Usuário ou senha incorretos, tente novamente';
        }
      }).whenComplete(() => loading = false);
    }
  }

  void openPrivacyPolicy() async {
    if (!await launchUrl(Uri.https('google.com.br'))) {
      msgResponse = 'Houve um erro ao tentar abrir a política de privacidade';
    }
  }
}
