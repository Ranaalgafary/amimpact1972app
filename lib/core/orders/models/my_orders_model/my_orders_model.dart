import 'dart:convert';

import 'order.dart';

class MyOrdersModel {
  List<Order>? orders;
  int? totalCount;

  MyOrdersModel({this.orders, this.totalCount});

  factory MyOrdersModel.fromMap(Map<String, dynamic> data) => MyOrdersModel(
        orders: (data['items'] as List<dynamic>?)
            ?.map((e) => Order.fromMap(e as Map<String, dynamic>))
            .toList(),
        totalCount: data['total_count'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'orders': orders?.map((e) => e.toMap()).toList(),
        'total_count': totalCount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyOrdersModel].
  factory MyOrdersModel.fromJson(String data) {
    return MyOrdersModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MyOrdersModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
