import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_sistemas_prova/app/data/models/card/card.model.dart';

abstract class CardStorage {
  Future<List<CardModel>?> getCardList();
  Future<bool> setCard(CardModel card);
  Future<bool> deleteCard(CardModel card);
}

class ICardStorage implements CardStorage {
  final _keyCard = 'card';

  @override
  Future<List<CardModel>?> getCardList() async {
    final cache = await SharedPreferences.getInstance();
    var res = cache.getString(_keyCard);
    if (res == null) return null;
    var resList = jsonDecode(res) as List;
    final resListCard = resList.map((e) => CardModel.fromJson(e)).toList();
    resListCard.sort((a, b) => a.createdOn!.isBefore(b.createdOn!) ? 0 : 1);
    return resListCard;
  }

  @override
  Future<bool> setCard(CardModel card) async {
    final cache = await SharedPreferences.getInstance();

    var listCard = await getCardList();
    listCard ??= [];
    listCard.add(card);
    var res = cache.setString(_keyCard, jsonEncode(listCard));
    return res;
  }

  @override
  Future<bool> deleteCard(CardModel card) async {
    final cache = await SharedPreferences.getInstance();

    var listCard = await getCardList();
    if (listCard == null) return false;
    listCard.removeWhere((e) => e.id == card.id);
    var res = cache.setString(_keyCard, jsonEncode(listCard));
    return res;
  }
}
