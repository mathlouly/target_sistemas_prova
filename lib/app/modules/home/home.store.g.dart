// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$_listCardAtom =
      Atom(name: '_HomeStore._listCard', context: context);

  @override
  List<CardModel>? get _listCard {
    _$_listCardAtom.reportRead();
    return super._listCard;
  }

  @override
  set _listCard(List<CardModel>? value) {
    _$_listCardAtom.reportWrite(value, super._listCard, () {
      super._listCard = value;
    });
  }

  late final _$_cardSelectedAtom =
      Atom(name: '_HomeStore._cardSelected', context: context);

  @override
  CardModel? get _cardSelected {
    _$_cardSelectedAtom.reportRead();
    return super._cardSelected;
  }

  @override
  set _cardSelected(CardModel? value) {
    _$_cardSelectedAtom.reportWrite(value, super._cardSelected, () {
      super._cardSelected = value;
    });
  }

  late final _$msgResponseAtom =
      Atom(name: '_HomeStore.msgResponse', context: context);

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

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void selectedCard(CardModel card) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.selectedCard');
    try {
      return super.selectedCard(card);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createCard() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.createCard');
    try {
      return super.createCard();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteCard(CardModel card) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.deleteCard');
    try {
      return super.deleteCard(card);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editCard() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.editCard');
    try {
      return super.editCard();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
msgResponse: ${msgResponse}
    ''';
  }
}
