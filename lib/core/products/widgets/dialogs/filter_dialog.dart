import 'dart:convert';

import 'package:amimpact/core/common/widgets/general/app_primary_button.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key, required this.filters}) : super(key: key);
  final Map<String, dynamic>? filters;

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late Map<String, dynamic> filters;
  @override
  void initState() {
    super.initState();
    filters = (widget.filters ?? {})..remove("cat");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.all(32),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تصفية حسب",
                  style: Theme.of(context)
                      .textTheme
                      .kufi14RegularTextStyle
                      .copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                ...filters.keys
                    .map((e) => _buildChoicesWidget(
                        item: filters[e] as Map<String, dynamic>))
                    .toList(),
                Row(
                  children: [
                    Expanded(
                      child: AppPrimaryButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "عرض النتائج",
                        textStyle: Theme.of(context)
                            .textTheme
                            .kufi14RegularTextStyle
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: AppPrimaryButton(
                        onPressed: () {
                          filters.keys.forEach((element) {
                            filters[element]["value"] = null;
                          });
                          Navigator.pop(context);
                        },
                        text: "حذف",
                        color: Colors.red,
                        textStyle: Theme.of(context)
                            .textTheme
                            .kufi14RegularTextStyle
                            .copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChoicesWidget({
    required Map<String, dynamic> item,
  }) {
    final key = item.keys.first;
    final List<_FilterModel> items =
        (jsonDecode(json.encode(item[key])) as List)
            .map((e) => _FilterModel.fromMap(e as Map<String, dynamic>))
            .toList();

    final _FilterModel? value = item["value"] == null
        ? null
        : _FilterModel.fromMap(item["value"] as Map<String, dynamic>);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            key,
            style: Theme.of(context)
                .textTheme
                .kufi14RegularTextStyle
                .copyWith(color: Colors.black),
          ),
          const Spacer(),
          SizedBox(
            width: 150,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<_FilterModel>(
                onChanged: (v) {
                  item["value"] = v?.toMap();
                  setState(() {});
                },
                isExpanded: true,
                value: value,
                hint: Center(
                  child: Text(
                    "إختر",
                    style: Theme.of(context).textTheme.kufi12RegularTextStyle,
                  ),
                ),
                items: items
                    .map(
                      (e) => DropdownMenuItem<_FilterModel>(
                        value: e,
                        child: Center(
                          child: Text(
                            e.display ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .kufi12RegularTextStyle
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FilterModel {
  final String? display;
  final String? value;
  final String? count;

  _FilterModel({this.display, this.value, this.count});

  factory _FilterModel.fromMap(Map<String, dynamic> map) {
    return _FilterModel(
      count: map["count"].toString(),
      value: map["value"].toString(),
      display: map["display"].toString(),
    );
  }

  Map<String, dynamic> toMap() =>
      {"count": count, "value": value, "display": display};

  @override
  bool operator ==(Object other) =>
      other is _FilterModel &&
      other.count == count &&
      other.display == display &&
      other.value == value;

  @override
  int get hashCode => count.hashCode + display.hashCode + value.hashCode;
}
