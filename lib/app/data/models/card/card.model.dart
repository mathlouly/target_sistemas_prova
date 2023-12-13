import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CardModel {
  int? id;
  String? text;
  DateTime? updatedAt;
  DateTime? createdOn;

  CardModel({
    this.id,
    this.text,
    this.updatedAt,
    this.createdOn,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'createdOn': createdOn?.millisecondsSinceEpoch,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'] != null ? map['id'] as int : null,
      text: map['text'] != null ? map['text'] as String : null,
      updatedAt: map['updatedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int) : null,
      createdOn: map['createdOn'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdOn'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) => CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  CardModel copyWith({
    int? id,
    String? text,
    DateTime? updatedAt,
    DateTime? createdOn,
  }) {
    return CardModel(
      id: id ?? this.id,
      text: text ?? this.text,
      updatedAt: updatedAt ?? this.updatedAt,
      createdOn: createdOn ?? this.createdOn,
    );
  }
}
