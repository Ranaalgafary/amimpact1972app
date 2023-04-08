import 'dart:convert';

import 'item.dart';

class BalanceHistoryModel {
  List<Item>? items;
  int? totalCount;

  BalanceHistoryModel({this.items, this.totalCount});

  factory BalanceHistoryModel.fromMap(Map<String, dynamic> data) {
    return BalanceHistoryModel(
      items: (data['items'] as List<dynamic>?)
          ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
          .toList(),
      totalCount: data['total_count'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'items': items?.map((e) => e.toMap()).toList(),
        'total_count': totalCount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BalanceHistoryModel].
  factory BalanceHistoryModel.fromJson(String data) {
    return BalanceHistoryModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BalanceHistoryModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
