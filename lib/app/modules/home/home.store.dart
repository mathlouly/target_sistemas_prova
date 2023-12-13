// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:target_sistemas_prova/app/data/models/card/card.model.dart';
import 'package:target_sistemas_prova/app/data/storage/card.storage.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home.store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final CardStorage _cardStorage;

  @observable
  List<CardModel>? _listCard;

  @observable
  CardModel? _cardSelected;

  @observable
  String? msgResponse;

  final textCard = TextEditingController();
  final focusCard = FocusNode();

  final _formKey = GlobalKey<FormState>();

  _HomeStore(this._cardStorage) {
    focusCard.requestFocus();
    retrieveListCard();
  }

  List<CardModel>? get listCard => _listCard;
  CardModel? get cardSelected => _cardSelected;
  GlobalKey<FormState> get formKey => _formKey;
  bool get listCardEmpty => _listCard == null || (_listCard?.isEmpty ?? true);

  String? validatorTextCard(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'O campo não pode estar vazio';

    return null;
  }

  Future retrieveListCard() async {
    await _cardStorage.getCardList().then((value) {
      _listCard = value;
    });
  }

  @action
  void selectedCard(CardModel card) {
    if (!focusCard.hasFocus) focusCard.requestFocus();
    _cardSelected = card;
    textCard.text = _cardSelected?.text ?? '';
  }

  @action
  void createCard() {
    if (_formKey.currentState!.validate()) {
      var card = CardModel(
        id: DateTime.now().millisecondsSinceEpoch,
        text: textCard.text,
        updatedAt: DateTime.now(),
        createdOn: DateTime.now(),
      );

      _cardStorage.setCard(card).then((value) async {
        if (value) {
          textCard.clear();
          await retrieveListCard();
        }
      });
    }
  }

  @action
  void deleteCard(CardModel card) {
    _cardStorage.deleteCard(card).then((value) async {
      if (value) {
        await retrieveListCard();
      }
    });
  }

  @action
  void editCard() {
    if (_formKey.currentState!.validate()) {
      var cardEdited = _cardSelected?.copyWith(
        text: textCard.text,
        updatedAt: DateTime.now(),
      );

      _cardStorage.deleteCard(_cardSelected!).then((value) {
        _cardStorage.setCard(cardEdited!).then((value) async {
          if (value) {
            textCard.clear();
            await retrieveListCard();
            _cardSelected = null;
          }
        });
      });
    }
  }

  void openPrivacyPolicy() async {
    if (!await launchUrl(Uri.https('google.com.br'))) {
      msgResponse = 'Houve um erro ao tentar abrir a política de privacidade';
    }
  }
}
