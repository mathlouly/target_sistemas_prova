// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on _SignInStore, Store {
  late final _$loadingAtom =
      Atom(name: '_SignInStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$msgResponseAtom =
      Atom(name: '_SignInStore.msgResponse', context: context);

  @override
  String? get msgResponse {
    _$msgResponseAtom.reportRead();
    return super.msgResponse;
  }

  @override
  set msgResponse(String? value) {
    _$msgResponseAtom.reportWrite(value, super.msgResponse, () {
      super.msgResponse = value;
    });
  }

  late final _$_SignInStoreActionController =
      ActionController(name: '_SignInStore', context: context);

  @override
  void submit() {
    final _$actionInfo =
        _$_SignInStoreActionController.startAction(name: '_SignInStore.submit');
    try {
      return super.submit();
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
msgResponse: ${msgResponse}
    ''';
  }
}
